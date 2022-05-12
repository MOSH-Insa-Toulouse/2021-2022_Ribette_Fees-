//capteur
int potPin = 0;
float Rs = 0.0 ;
float R5 = 10000.0 ;
float R1 = 100000.0 ;
float R2 = 1000.0 ;
float R3 = 270000.0 ;
float R6 = 1000.0 ;
float R2prime = 33.0 ; 
float Vcc = 5.0 ;
int Scale = 1 ; 

//bluetooth
#include <SoftwareSerial.h> 
#define rxPin 6 // broche rx ard à 11
#define txPin 5 // "" tx "" 12
#define baudrate  9600 
#define baudrate_Serial 9600 
SoftwareSerial mySerial(rxPin,txPin) ; //définition du software serial 
int X = 0 ;

//Debouncing de l'encodeur rotatoire 
//Rotary_encoder 
#define encoder0PinA  2  //CLK Output A Do not use other pin for clock as we are using interrupt
#define encoder0PinB  3  //DT Output B
#define Switch 4 // Switch connection non available for interruption 
volatile int encoder0Pos = 120;
int encoder0Pos1 ;
long PreviousMillis = 0 ; 
long LastMillis = 0 ; 


// SPI Digital potentiometer début
int res_spi = 255 ; 
/*
MCP41xxx Digital Pot Control
 
This example controls an MCP41xxx digital potentiometer.
PBn - One side of potentiometer
PWn - Pot wiper
PAn - Other side of potentiometer
 
The MCP41xxx is SPI-compatible. The hardware is managed by 
sending two bytes:
BYTE 1 - is a command byte (NOP, WRITE, SHUTDOWN)
BYTE 2 - is the data byte (new setpoint value 0-255). 
 
The MCP IC circuit:
* PB0 to ground 
* PA0 to Vcc
* PW0 Connect a multimeter between PW0 and ground to measure resistance 
* CS - to digital pin 10 (SS pin)
* SDI - to digital pin 11 (MOSI pin)
* CLK - to digital pin 13 (SCK pin)
*/

#include <SPI.h>

// Define the MCP41100 OP command bits (only one POT)
// Note: command byte format xxCCxxPP, CC command, PP pot number (01 if selected) 
#define MCP_NOP 0b00000000
#define MCP_WRITE 0b00010001
#define MCP_SHTDWN 0b00100001

const int ssMCPin = 10; // Define the slave select for the digital pot

#define WAIT_DELAY 500

void SPIWrite(uint8_t cmd, uint8_t data, uint8_t ssPin) // SPI write the command and data to the MCP IC connected to the ssPin
{
  SPI.beginTransaction(SPISettings(14000000, MSBFIRST, SPI_MODE0)); //https://www.arduino.cc/en/Reference/SPISettings
  
  digitalWrite(ssPin, LOW); // SS pin low to select chip
  
  SPI.transfer(cmd);        // Send command code
  SPI.transfer(data);       // Send associated value
  
  digitalWrite(ssPin, HIGH);// SS pin high to de-select chip
  SPI.endTransaction();
}

// SPI digital potentiometer fin 




//OLED I2C 
#include <Adafruit_SSD1306.h> 
#define nombreDePixelsEnLargeur 128 //Taille OLED n°pixels largeur 
#define nombreDePixelsEnHauteur 64 
#define brocheResetOLED -1 //Reset de l'OLED partagé avec l'arduino
#define adresseI2CecranOLED 0x3C //Adresse de mon écran (7 bits vers 8) 

Adafruit_SSD1306 ecranOLED(nombreDePixelsEnLargeur,nombreDePixelsEnHauteur,&Wire, brocheResetOLED);






void setup() {
  //série
  Serial.begin(baudrate_Serial);

  //bluetooth
  pinMode(rxPin,INPUT) ; 
  pinMode(txPin,OUTPUT); 
  mySerial.begin(baudrate); //démarrage port série bluetooth 

  //SPI potentiomètre digital
  pinMode (ssMCPin, OUTPUT); //select pin output
  digitalWrite(ssMCPin, HIGH); //SPI chip disabled
  SPI.begin(); 
  Serial.println(F("[MCP Digital Pot Test]")); //print to serial

  //OLED I2C 
    // initialisation écran OLED 
    if(!ecranOLED.begin(SSD1306_SWITCHCAPVCC,adresseI2CecranOLED))
      while(1); //arret du programme (boucle inf) si échec d'initialisation
      
    boolean Color_invert=false ; 
    ecranOLED.clearDisplay();
    ecranOLED.setTextSize(2);
    ecranOLED.setCursor(0,0);
    ecranOLED.setTextColor(SSD1306_WHITE);

  //Rotary_encoder 
  pinMode(encoder0PinA, INPUT); 
  digitalWrite(encoder0PinA, HIGH);       // turn on pullup resistor
  pinMode(encoder0PinB, INPUT); 
  digitalWrite(encoder0PinB, HIGH);       // turn on pullup resistor
  pinMode(Switch, INPUT);
  digitalWrite(Switch, HIGH);

  attachInterrupt(digitalPinToInterrupt(encoder0PinA), doEncoder, CHANGE);

  Serial.begin(9600);
  Serial.println("start");
  
}




void loop() {

  // Ajustement du gain tel que Vadc soit à 2.5 V
  // proportionnel 
  // a : fonction de l'erreur 
  float k = 5.0 ; 
  float dV = 1.0 ;
  float Vconsigne = 2.5 ;  
  dV= abs(Vconsigne - float(analogRead(potPin))*5.0/1023.0) ;  
  if (float(analogRead(potPin))*5.0/1023.0 > Vconsigne) {
    encoder0Pos = encoder0Pos - int(dV*k);
   
    }
    else {
      encoder0Pos = encoder0Pos + int(dV*k); 
     
   }
   if (encoder0Pos < 0){encoder0Pos =0; }
   if (encoder0Pos >255){encoder0Pos=255; }
  
    //Rotary_encoder 
 
  //POS = encoder0Pos ; 

  
  //SPI potentiomètre digital (rampe de test) 
  //attention à le brancher en rhéostat (A à W et mesurer une résistance entre B et W) 

  // 255 -> 340 ohms 
  // 0 -> 51,6 kohms 
  //R max (0 -> 51.8k ohm) 
  //R min (255 -> 0 ohm)=> R véritable = ((255-res_spi)/255)*51.8kohm
  // écriture de la valeur de position de l'encodeur si elle est dans les limites
  res_spi = encoder0Pos ; 
  if (res_spi >=0 && res_spi <=255){
  SPIWrite(MCP_WRITE, res_spi, ssMCPin);
  }
  //SPIWrite(MCP_WRITE, res_spi, ssMCPin);
  float Rveritable = (((255.0-float(res_spi))/255.0)*(51700.0-340.0)+340.0) ; 
  //écriture de la valeur
  R2 = Rveritable ;
  //Serial.println(Rveritable); 

  // capteur début
  float Vadc = analogRead(potPin);
  Vadc = 5.0*Vadc/1023.0 ;
  Rs = (1+R3/(R2+R2prime))*R1*(Vcc/Vadc)-R1-R5 ;

  //capteur fin


  //bluetooth debut 
  /*
  int i =0 ; 
  char someChar[32]={0}; 
  // réception des données 
  while(Serial.available()){
    //structure do-while pour l'utilisation
    do{
      someChar[i++]=Serial.read();
      delay(3) ; 
    }while (Serial.available()>0);
    
    mySerial.println(someChar);
    Serial.println(someChar);  
  }
  while (mySerial.available()){
    Serial.print((char)mySerial.read());    
  }
  */ 

  // Mise en kOhm et envoi de la donnée
  Rs = Rs/1000.0 ; 


// mapping de la donnée 
  int Rsend = 0 ; 
  int toLow = 0 ; 
  int toHigh = 127 ;
  //fromLow => valeur inférieure du scaling
  //fromHigh => valeur supérieure du scaling 
  int fromLow = 0 ; 
  int fromHigh = 10000 ;  
    switch (Scale) {
    case 1:
      // statements si la valeur du scale est 1
      fromLow = 0 ; 
      fromHigh = 10000 ;  
      break;
    case 2:
     // statements si la valeur du scale est 2
     fromLow = 1000 ; 
     fromHigh = 9000 ; 
      break;
    case 3:
      // statements si la valeur du scale est 3
      fromLow = 2000 ; 
      fromHigh = 8000 ; 
      break;
    case 4:
      // statements si la valeur du scale est 4
      fromLow = 3000 ; 
      fromHigh = 7000 ;
      break;
    case 5:
      // statementssi la valeur du scale est 5
      fromLow = 4000 ; 
      fromHigh = 6000 ;
      break;
    case 6:
      // statementssi la valeur du scale est 5
      fromLow = 4500 ; 
      fromHigh = 5500 ;
      break;
    default:
      // statements à faire par défaut 
      
      break;
  }
  constrain(Rsend ,fromLow ,fromHigh); 
  Rsend = map(int(Rs), fromLow, fromHigh, toLow, toHigh); 
  
  mySerial.println(char(Rsend));
  //mySerial.write(char()) ; 
  //problème : les valeurs ne sont pas centrées du tout
  /*
  if(X<250){
  X = X +1 ;
  mySerial.write(X) ; 
  } else {X=0; }
  */
  
  // affichage sur le prompt de Rsend
  //Serial.print("Rsend ");
  //Serial.print(Rsend) ; 

  Serial.print("X ");
  Serial.print(X) ; 
  Serial.print(" ") ; Serial.print(Scale) ; 
  //mySerial.println() ; // écriture des données du capteur  
  //bluetooth fin 







  //OLED
  ecranOLED.clearDisplay();
  ecranOLED.setCursor(0,0) ; 
  ecranOLED.print("Res:"); 
  ecranOLED.println("(kOhm)") ;
  ecranOLED.println(Rs) ; 
  
  // affichage de la valeur de l'encodeur rotatoire 
  ecranOLED.print("Pos=");
  ecranOLED.println(encoder0Pos);

  //affichage de RES SAT si la résistance sature 
  if(Rs < 0.01){
    ecranOLED.print("RES ");
  }
  else{
  //ecranOLED.print("Rv=");
  //ecranOLED.print(Rveritable);
  }
  ecranOLED.print("Scale= ");
  ecranOLED.print(Scale);

  ecranOLED.display() ; 
  delay(300);


  // affichage série + traceur 
  //Serial.print("k = ") ; 
  //Serial.println(k) ; 
  //Serial.print("dV = ") ; 
  //Serial.println(dV) ; 
  //Serial.print("Position:");
  //Serial.println (encoder0Pos, DEC);  //Angle = (360 / Encoder_Resolution) * encoder0Pos 
  Serial.print("Vadc = "); 
  Serial.println(Vadc) ;
  Serial.println(Vconsigne) ;
  //Serial.println("Rs = " + String (Rs)) ;
}



//fonction d'interruption pour la data de l'encodeur rotatoire
//Debouncing réglé à 150 
void doEncoder() {
  
  LastMillis = millis() ; 
  if (abs(LastMillis - PreviousMillis) >= 150){
  if (digitalRead(encoder0PinB)==HIGH) {
    //encoder0Pos++;
    Scale++ ; 
    }
    else {
      //encoder0Pos--;
      Scale--; 
   }
   PreviousMillis = millis() ; 
}
}
