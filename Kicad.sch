EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9350 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
A0
Text Label 8900 2600 0    60   ~ 0
A1
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 8900 2900 0    60   ~ 0
A4(SDA)
Text Label 8900 3000 0    60   ~ 0
A5(SCL)
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10550 2700 0    60   ~ 0
3(**)
Text Label 10550 2600 0    60   ~ 0
4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Label 10550 1300 0    60   ~ 0
A4(SDA)
Text Label 10550 1200 0    60   ~ 0
A5(SCL)
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Kicad-rescue:Conn_01x08-Connector_Generic P1
U 1 1 56D70129
P 9600 1900
F 0 "P1" H 9600 2350 50  0000 C CNN
F 1 "Power" V 9700 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1900 20  0000 C CNN
F 3 "" H 9600 1900 50  0000 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset
$Comp
L Kicad-rescue:+3.3V-power #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" V 9150 1700 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:+5V-power #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" V 9050 1550 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:GND-power #PWR03
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR03" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:GND-power #PWR04
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR04" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:Conn_01x06-Connector_Generic P2
U 1 1 56D70DD8
P 9600 2700
F 0 "P2" H 9600 2300 50  0000 C CNN
F 1 "Analog" V 9700 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2750 20  0000 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:Conn_01x01-Connector_Generic P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L Kicad-rescue:Conn_01x01-Connector_Generic P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Kicad-rescue:Conn_01x01-Connector_Generic P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Kicad-rescue:Conn_01x01-Connector_Generic P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Kicad-rescue:Conn_01x08-Connector_Generic P4
U 1 1 56D7164F
P 10000 2600
F 0 "P4" H 10000 2100 50  0000 C CNN
F 1 "Digital" V 10100 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2550 20  0000 C CNN
F 3 "" H 10000 2600 50  0000 C CNN
	1    10000 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9350 1450 9350 1700
Wire Wire Line
	9350 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
$Comp
L Kicad-rescue:Conn_01x10-Connector_Generic P3
U 1 1 56D721E0
P 10000 1600
F 0 "P3" H 10000 2150 50  0000 C CNN
F 1 "Digital" V 10100 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1600 20  0000 C CNN
F 3 "" H 10000 1600 50  0000 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 2200
Wire Wire Line
	9300 2200 9300 3150
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	8500 3450 11200 3450
Wire Wire Line
	9400 1800 8650 1800
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
$Comp
L Kicad-rescue:Potentiometre_digital-Librairie_symboles P9
U 1 1 621E77B2
P 6400 4300
F 0 "P9" H 7077 4471 50  0000 L CNN
F 1 "Potentiometre_digital" H 7077 4380 50  0000 L CNN
F 2 "Librairies_empreintes_projet:potentiometre_digital" H 6450 4500 50  0001 C CNN
F 3 "" H 6450 4500 50  0001 C CNN
	1    6400 4300
	0    1    1    0   
$EndComp
$Comp
L Kicad-rescue:LTC_1050-Librairie_symboles U2
U 1 1 621EA5AB
P 3850 1850
F 0 "U2" H 4228 1846 50  0000 L CNN
F 1 "LTC_1050" H 4228 1755 50  0000 L CNN
F 2 "Librairies_empreintes_projet:LTC_1050" H 4250 1850 50  0001 C CNN
F 3 "" H 4250 1850 50  0001 C CNN
	1    3850 1850
	0    1    1    0   
$EndComp
$Comp
L Kicad-rescue:+5V-power #PWR06
U 1 1 621EC09A
P 1000 1500
F 0 "#PWR06" H 1000 1350 50  0001 C CNN
F 1 "+5V" H 1015 1673 50  0000 C CNN
F 2 "" H 1000 1500 50  0001 C CNN
F 3 "" H 1000 1500 50  0001 C CNN
	1    1000 1500
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:R-Device R0
U 1 1 6220B6C9
P 1000 1750
F 0 "R0" H 1070 1796 50  0000 L CNN
F 1 "Rsensor" H 1070 1705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 930 1750 50  0001 C CNN
F 3 "~" H 1000 1750 50  0001 C CNN
	1    1000 1750
	1    0    0    -1  
$EndComp
Text GLabel 7400 2050 2    50   Input ~ 0
ADC
Text GLabel 5200 2850 3    50   Input ~ 0
IN-
Text GLabel 3300 1900 0    50   Input ~ 0
IN+
Text GLabel 850  7000 3    50   Input ~ 0
RX
Text GLabel 1150 7350 3    50   Input ~ 0
TX
Text GLabel 8800 2900 0    50   Input ~ 0
SDA
Text GLabel 8800 3000 0    50   Input ~ 0
SCK
Wire Notes Line
	8300 3250 8300 900 
Wire Notes Line
	850  900  8300 900 
Wire Notes Line
	850  900  850  3250
Wire Notes Line
	850  3250 8300 3250
Text Notes 950  1050 0    50   ~ 0
Amplificateur-LTC1050
$Comp
L Kicad-rescue:+5V-power #PWR012
U 1 1 62218BEA
P 5000 1200
F 0 "#PWR012" H 5000 1050 50  0001 C CNN
F 1 "+5V" H 5015 1373 50  0000 C CNN
F 2 "" H 5000 1200 50  0001 C CNN
F 3 "" H 5000 1200 50  0001 C CNN
	1    5000 1200
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:+5V-power #PWR014
U 1 1 6221A0AE
P 4750 6550
F 0 "#PWR014" H 4750 6400 50  0001 C CNN
F 1 "+5V" H 4765 6723 50  0000 C CNN
F 2 "" H 4750 6550 50  0001 C CNN
F 3 "" H 4750 6550 50  0001 C CNN
	1    4750 6550
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:R-Device R5
U 1 1 6221D9B4
P 1600 2050
F 0 "R5" V 1807 2050 50  0000 C CNN
F 1 "10k" V 1716 2050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1530 2050 50  0001 C CNN
F 3 "~" H 1600 2050 50  0001 C CNN
	1    1600 2050
	0    -1   -1   0   
$EndComp
$Comp
L Kicad-rescue:R-Device R1
U 1 1 6221E4CE
P 2050 2350
F 0 "R1" H 2120 2396 50  0000 L CNN
F 1 "100k" H 2120 2305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1980 2350 50  0001 C CNN
F 3 "~" H 2050 2350 50  0001 C CNN
	1    2050 2350
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:R-Device R3
U 1 1 6221ED11
P 4750 2350
F 0 "R3" H 4820 2396 50  0000 L CNN
F 1 "100k" H 4820 2305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4680 2350 50  0001 C CNN
F 3 "~" H 4750 2350 50  0001 C CNN
	1    4750 2350
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:R-Device R6
U 1 1 6221F3C8
P 5750 2050
F 0 "R6" V 5543 2050 50  0000 C CNN
F 1 "1k" V 5634 2050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5680 2050 50  0001 C CNN
F 3 "~" H 5750 2050 50  0001 C CNN
	1    5750 2050
	0    1    1    0   
$EndComp
$Comp
L Kicad-rescue:R-Device R2
U 1 1 6221FAB0
P 5750 2650
F 0 "R2" V 5543 2650 50  0000 C CNN
F 1 "500" V 5634 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5680 2650 50  0001 C CNN
F 3 "~" H 5750 2650 50  0001 C CNN
	1    5750 2650
	0    1    1    0   
$EndComp
$Comp
L Kicad-rescue:C-Device C2
U 1 1 622203DB
P 7100 2350
F 0 "C2" H 7215 2396 50  0000 L CNN
F 1 "100n" H 7215 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 7138 2200 50  0001 C CNN
F 3 "~" H 7100 2350 50  0001 C CNN
	1    7100 2350
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:C-Device C4
U 1 1 622214C3
P 5200 2350
F 0 "C4" H 5315 2396 50  0000 L CNN
F 1 "1??" H 5315 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.5mm_W6.5mm_P5.00mm" H 5238 2200 50  0001 C CNN
F 3 "~" H 5200 2350 50  0001 C CNN
	1    5200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2200 5200 2050
Wire Wire Line
	5200 2050 5600 2050
Wire Wire Line
	4750 2200 4750 2050
Wire Wire Line
	7100 2200 7100 2050
Wire Wire Line
	7100 2500 7100 2650
Wire Wire Line
	5200 2500 5200 2650
Wire Wire Line
	5200 2650 5600 2650
Wire Wire Line
	4750 2650 4750 2500
Connection ~ 5200 2650
Text GLabel 3300 1750 0    50   Input ~ 0
IN-
Wire Wire Line
	5200 2850 5200 2650
Wire Wire Line
	4100 1900 4750 1900
Wire Wire Line
	4750 1900 4750 2050
Connection ~ 4750 2050
$Comp
L Kicad-rescue:C-Device C3
U 1 1 6222D0B3
P 5000 1450
F 0 "C3" H 5115 1496 50  0000 L CNN
F 1 "100n" H 5115 1405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 5038 1300 50  0001 C CNN
F 3 "~" H 5000 1450 50  0001 C CNN
	1    5000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1750 4650 1750
Wire Wire Line
	4650 1750 4650 1300
Wire Wire Line
	4650 1300 5000 1300
Wire Wire Line
	5000 1200 5000 1300
Connection ~ 5000 1300
$Comp
L Kicad-rescue:GND-power #PWR013
U 1 1 622318FA
P 5000 1700
F 0 "#PWR013" H 5000 1450 50  0001 C CNN
F 1 "GND" H 5005 1527 50  0000 C CNN
F 2 "" H 5000 1700 50  0001 C CNN
F 3 "" H 5000 1700 50  0001 C CNN
	1    5000 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1600 5000 1700
$Comp
L Kicad-rescue:GND-power #PWR015
U 1 1 622334B0
P 7100 2850
F 0 "#PWR015" H 7100 2600 50  0001 C CNN
F 1 "GND" H 7105 2677 50  0000 C CNN
F 2 "" H 7100 2850 50  0001 C CNN
F 3 "" H 7100 2850 50  0001 C CNN
	1    7100 2850
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:GND-power #PWR05
U 1 1 62234CBF
P 850 6450
F 0 "#PWR05" H 850 6200 50  0001 C CNN
F 1 "GND" H 855 6277 50  0000 C CNN
F 2 "" H 850 6450 50  0001 C CNN
F 3 "" H 850 6450 50  0001 C CNN
	1    850  6450
	-1   0    0    1   
$EndComp
$Comp
L Kicad-rescue:+5V-power #PWR07
U 1 1 6223654E
P 1100 6400
F 0 "#PWR07" H 1100 6250 50  0001 C CNN
F 1 "+5V" H 1115 6573 50  0000 C CNN
F 2 "" H 1100 6400 50  0001 C CNN
F 3 "" H 1100 6400 50  0001 C CNN
	1    1100 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2650 7100 2850
Connection ~ 7100 2650
Wire Wire Line
	7100 2050 7400 2050
Connection ~ 7100 2050
Wire Wire Line
	4750 2050 5200 2050
Connection ~ 5200 2050
Wire Wire Line
	4750 2650 5200 2650
NoConn ~ 4350 2050
NoConn ~ 4350 1600
NoConn ~ 3250 1600
Wire Wire Line
	4350 1600 4100 1600
Wire Wire Line
	4350 2050 4100 2050
Wire Wire Line
	3250 1600 3500 1600
Wire Wire Line
	3300 1750 3500 1750
Wire Wire Line
	3500 1900 3300 1900
$Comp
L Kicad-rescue:GND-power #PWR011
U 1 1 62253A8D
P 3150 2400
F 0 "#PWR011" H 3150 2150 50  0001 C CNN
F 1 "GND" H 3155 2227 50  0000 C CNN
F 2 "" H 3150 2400 50  0001 C CNN
F 3 "" H 3150 2400 50  0001 C CNN
	1    3150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2050 3500 2050
Wire Wire Line
	3150 2050 3150 2400
Text GLabel 2750 2050 2    50   Input ~ 0
IN+
$Comp
L Kicad-rescue:C-Device C1
U 1 1 6225E742
P 2500 2350
F 0 "C1" H 2615 2396 50  0000 L CNN
F 1 "100n" H 2615 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 2538 2200 50  0001 C CNN
F 3 "~" H 2500 2350 50  0001 C CNN
	1    2500 2350
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:GND-power #PWR09
U 1 1 6225F104
P 2250 2750
F 0 "#PWR09" H 2250 2500 50  0001 C CNN
F 1 "GND" H 2255 2577 50  0000 C CNN
F 2 "" H 2250 2750 50  0001 C CNN
F 3 "" H 2250 2750 50  0001 C CNN
	1    2250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2750 2250 2600
Wire Wire Line
	2250 2600 2500 2600
Wire Wire Line
	2500 2600 2500 2500
Wire Wire Line
	2250 2600 2050 2600
Wire Wire Line
	2050 2600 2050 2500
Connection ~ 2250 2600
Wire Wire Line
	2500 2200 2500 2050
Wire Wire Line
	2050 2050 2050 2200
Connection ~ 2050 2050
Wire Wire Line
	1000 1900 1000 2050
Wire Wire Line
	1000 2050 1450 2050
Wire Wire Line
	1000 1600 1000 1500
Connection ~ 2500 2050
Wire Wire Line
	2500 2050 2750 2050
Wire Wire Line
	1750 2050 2050 2050
Wire Wire Line
	2050 2050 2500 2050
$Comp
L Kicad-rescue:Bluetooth_module_HC_05-Librairie_symboles U1
U 1 1 621E18DC
P 2250 6350
F 0 "U1" H 2728 6096 50  0000 L CNN
F 1 "Bluetooth_module_HC_05" H 2728 6005 50  0000 L CNN
F 2 "Librairies_empreintes_projet:hc05" H 2100 6550 50  0001 C CNN
F 3 "" H 2100 6550 50  0001 C CNN
	1    2250 6350
	1    0    0    -1  
$EndComp
Wire Notes Line
	600  5700 3750 5700
Wire Notes Line
	3750 5700 3750 7700
Wire Notes Line
	3750 7700 600  7700
Wire Notes Line
	600  5700 600  7700
Text Notes 700  5850 0    50   ~ 0
Module Bluetooth
NoConn ~ 1450 6450
NoConn ~ 1450 6950
Wire Wire Line
	1450 6450 1650 6450
Wire Wire Line
	1650 6550 1100 6550
Wire Wire Line
	1100 6550 1100 6400
Wire Wire Line
	1650 6650 850  6650
Wire Wire Line
	850  6450 850  6650
Wire Wire Line
	1650 6850 1150 6850
Wire Wire Line
	1150 6850 1150 7350
Wire Wire Line
	850  6750 850  7000
Wire Wire Line
	850  6750 1650 6750
Text GLabel 10900 2500 2    50   Input ~ 0
TX
Text GLabel 10900 2400 2    50   Input ~ 0
RX
Wire Wire Line
	10200 1900 11050 1900
Wire Wire Line
	10200 1800 11050 1800
Text GLabel 8800 2500 0    50   Input ~ 0
ADC
Wire Wire Line
	8800 2500 9400 2500
Wire Wire Line
	8800 2900 9400 2900
Wire Wire Line
	8800 3000 9400 3000
Wire Wire Line
	10200 2600 10900 2600
Wire Wire Line
	10200 2700 10900 2700
Wire Wire Line
	10200 2800 10850 2800
Wire Wire Line
	1450 6950 1650 6950
Wire Notes Line
	8150 3450 8150 5450
Wire Notes Line
	4950 5450 4950 3450
Text Notes 5050 3600 0    50   ~ 0
Potentiom??tre digital
Text GLabel 7600 1150 2    50   Input ~ 0
R_var_in
Text GLabel 7600 1350 2    50   Input ~ 0
R_var_out
Wire Wire Line
	10200 2500 10900 2500
Wire Wire Line
	10200 2400 10900 2400
Wire Wire Line
	6950 4150 7150 4150
Wire Wire Line
	7150 4150 7150 4350
Wire Wire Line
	7150 4350 6950 4350
Text Notes 5900 3600 0    50   ~ 0
(en mode rh??ostat)
Connection ~ 7150 4350
Text GLabel 7200 1150 0    50   Input ~ 0
R_var_in
Text GLabel 6400 1150 2    50   Input ~ 0
R_var_out
$Comp
L Kicad-rescue:+5V-power #PWR016
U 1 1 623645BB
P 10100 5000
F 0 "#PWR016" H 10100 4850 50  0001 C CNN
F 1 "+5V" H 10115 5173 50  0000 C CNN
F 2 "" H 10100 5000 50  0001 C CNN
F 3 "" H 10100 5000 50  0001 C CNN
	1    10100 5000
	-1   0    0    1   
$EndComp
$Comp
L Kicad-rescue:+5V-power #PWR010
U 1 1 6236848B
P 7200 3950
F 0 "#PWR010" H 7200 3800 50  0001 C CNN
F 1 "+5V" H 7215 4123 50  0000 C CNN
F 2 "" H 7200 3950 50  0001 C CNN
F 3 "" H 7200 3950 50  0001 C CNN
	1    7200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3950 6950 3950
$Comp
L Kicad-rescue:GND-power #PWR08
U 1 1 6237010B
P 5600 4600
F 0 "#PWR08" H 5600 4350 50  0001 C CNN
F 1 "GND" H 5605 4427 50  0000 C CNN
F 2 "" H 5600 4600 50  0001 C CNN
F 3 "" H 5600 4600 50  0001 C CNN
	1    5600 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4550 5600 4550
Wire Wire Line
	5600 4550 5600 4600
Text GLabel 5700 3950 0    50   Input ~ 0
10~A
Text GLabel 5700 4150 0    50   Input ~ 0
13A
Text GLabel 5700 4350 0    50   Input ~ 0
11~A
Wire Wire Line
	6100 4150 5700 4150
Wire Wire Line
	6100 3950 5700 3950
Wire Wire Line
	6100 4350 5700 4350
Text Notes 6700 3600 0    50   ~ 0
?? mettre ?? la place de R2
Text GLabel 11050 1900 2    50   Input ~ 0
10~A
Text GLabel 11000 1600 2    50   Input ~ 0
13A
Text GLabel 11050 1800 2    50   Input ~ 0
11~A
Wire Wire Line
	10200 1600 11000 1600
$Comp
L Kicad-rescue:OLED_0.91-Librairie_symboles O1
U 1 1 623A27FC
P 10000 3950
F 0 "O1" H 10528 3963 50  0000 L CNN
F 1 "OLED_0.91" H 10528 3872 50  0000 L CNN
F 2 "Librairies_empreintes_projet:SIP-4" H 10000 4000 50  0001 C CNN
F 3 "" H 10000 4000 50  0001 C CNN
	1    10000 3950
	1    0    0    -1  
$EndComp
Wire Notes Line
	4700 3450 4700 5450
Wire Notes Line
	600  3450 600  5450
Wire Notes Line
	8500 3500 11000 3500
Wire Notes Line
	11000 5500 8500 5500
Wire Notes Line
	11000 3500 11000 5500
Wire Notes Line
	8500 3500 8500 5500
Text Notes 8600 3650 0    50   ~ 0
Ecran OLED
$Comp
L Kicad-rescue:GND-power #PWR0101
U 1 1 623DFC9A
P 9950 5200
F 0 "#PWR0101" H 9950 4950 50  0001 C CNN
F 1 "GND" H 9955 5027 50  0000 C CNN
F 2 "" H 9950 5200 50  0001 C CNN
F 3 "" H 9950 5200 50  0001 C CNN
	1    9950 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 4300 9950 5200
Wire Wire Line
	10100 4300 10100 5000
Text GLabel 10250 4900 3    50   Input ~ 0
SDA
Text GLabel 10400 4900 3    50   Input ~ 0
SCK
Wire Wire Line
	10250 4900 10250 4300
Wire Wire Line
	10400 4900 10400 4300
$Comp
L Kicad-rescue:PWR_FLAG-power #FLG0101
U 1 1 6242649A
P 4750 6900
F 0 "#FLG0101" H 4750 6975 50  0001 C CNN
F 1 "PWR_FLAG" H 4750 7073 50  0000 C CNN
F 2 "" H 4750 6900 50  0001 C CNN
F 3 "~" H 4750 6900 50  0001 C CNN
	1    4750 6900
	-1   0    0    1   
$EndComp
$Comp
L Kicad-rescue:GNDPWR-power #PWR0104
U 1 1 62426DED
P 5350 6900
F 0 "#PWR0104" H 5350 6700 50  0001 C CNN
F 1 "GNDPWR" H 5354 6746 50  0000 C CNN
F 2 "" H 5350 6850 50  0001 C CNN
F 3 "" H 5350 6850 50  0001 C CNN
	1    5350 6900
	1    0    0    -1  
$EndComp
$Comp
L Kicad-rescue:GND-power #PWR0105
U 1 1 6243EC85
P 5350 6550
F 0 "#PWR0105" H 5350 6300 50  0001 C CNN
F 1 "GND" H 5355 6377 50  0000 C CNN
F 2 "" H 5350 6550 50  0001 C CNN
F 3 "" H 5350 6550 50  0001 C CNN
	1    5350 6550
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 6550 5350 6900
Wire Wire Line
	4750 6900 4750 6550
Wire Notes Line
	6550 5700 4100 5700
Wire Notes Line
	4100 5700 4100 7650
Wire Notes Line
	4100 7650 6550 7650
Wire Notes Line
	6550 5700 6550 7650
Text Notes 4200 5850 0    50   ~ 0
Power flags
NoConn ~ 10550 1700
Wire Wire Line
	5900 2050 7100 2050
Wire Notes Line
	6900 2800 6900 2350
Wire Notes Line
	6900 2350 5550 2350
Wire Notes Line
	5550 2350 5550 2800
Wire Notes Line
	5550 2800 6900 2800
Text Notes 5650 2900 0    50   ~ 0
R2 + Rvariable
NoConn ~ 10550 3000
NoConn ~ 10550 2900
NoConn ~ 8900 2800
NoConn ~ 8900 2700
NoConn ~ 8900 2600
NoConn ~ 9150 1450
NoConn ~ 8650 1800
NoConn ~ 9350 1450
NoConn ~ 10550 1400
NoConn ~ 10550 2000
NoConn ~ 10550 2100
NoConn ~ 8950 1450
NoConn ~ 10550 2300
Wire Wire Line
	6450 2650 6450 3350
Wire Wire Line
	6450 3350 7700 3350
Wire Wire Line
	7700 3350 7700 4350
Wire Wire Line
	7150 4350 7700 4350
Wire Wire Line
	5900 2650 6450 2650
Wire Wire Line
	6750 2650 6750 3150
Wire Wire Line
	6750 3150 7850 3150
Wire Wire Line
	7850 3150 7850 4550
Wire Wire Line
	6750 2650 7100 2650
Wire Wire Line
	6950 4550 7850 4550
Text GLabel 10900 2600 2    50   Input ~ 0
SWITCH
Text GLabel 10900 2700 2    50   Input ~ 0
DATA
Text GLabel 10850 2800 2    50   Input ~ 0
CLK
Wire Notes Line
	4950 3450 8150 3450
Wire Notes Line
	8150 5450 4950 5450
Wire Wire Line
	3100 4250 2550 4250
Wire Wire Line
	3100 4500 2450 4500
Wire Wire Line
	3100 4750 2400 4750
Text GLabel 2550 4250 0    50   Input ~ 0
SWITCH
Text GLabel 2450 4500 0    50   Input ~ 0
DATA
Text GLabel 2400 4750 0    50   Input ~ 0
CLK
Wire Wire Line
	3100 4000 2400 4000
$Comp
L Kicad-rescue:+5V-power #PWR0103
U 1 1 6240308C
P 2400 4000
F 0 "#PWR0103" H 2400 3850 50  0001 C CNN
F 1 "+5V" H 2415 4173 50  0000 C CNN
F 2 "" H 2400 4000 50  0001 C CNN
F 3 "" H 2400 4000 50  0001 C CNN
	1    2400 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 3750 2200 3750
$Comp
L Kicad-rescue:GND-power #PWR0102
U 1 1 623FE4A7
P 2200 3750
F 0 "#PWR0102" H 2200 3500 50  0001 C CNN
F 1 "GND" H 2205 3577 50  0000 C CNN
F 2 "" H 2200 3750 50  0001 C CNN
F 3 "" H 2200 3750 50  0001 C CNN
	1    2200 3750
	0    1    1    0   
$EndComp
Text Notes 750  3600 0    50   ~ 0
Encodeur rotatoire
Wire Notes Line
	600  5450 4700 5450
Wire Notes Line
	600  3450 4700 3450
$Comp
L Kicad-rescue:Encodeur_rotatoire-Librairie_symboles E1
U 1 1 623A1B53
P 4200 4250
F 0 "E1" H 4878 3888 50  0000 L CNN
F 1 "Encodeur_rotatoire" H 4878 3797 50  0000 L CNN
F 2 "Librairies_empreintes_projet:SIP-5" H 4200 4250 50  0001 C CNN
F 3 "" H 4200 4250 50  0001 C CNN
	1    4200 4250
	0    1    1    0   
$EndComp
$EndSCHEMATC
