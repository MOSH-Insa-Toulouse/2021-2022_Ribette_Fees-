# 2021-2022_Ribette_Fees-
Projet capteur INSA Toulouse 2021-2022

# Sommaire
[1. A propos du projet](#A_propos)

[2. Circuit électronique](#Circuit_elec)

[3. Schématique et PCB KiCad](#Schem)

[4. Code Arduino](#Code)

[5. Application APK Bluetooth](#App)

[6. Banc de test](Banc)

[7. Datasheet](Sheet)

# 1. A propos du projet <a class="anchor" id="A_propos"></a>

Ce répertoire comporte les différentes étapes effectuées pour le projet de l'UF "Du capteur au banc de test en open source hardware" proposé en 4ème année de Génie Physique de l'INSA Toulouse. Ce travail a été effectué par Antoine Fées et Mathis Ribette, sous la direction de M. Jérémie Grisolia, et avec l'aide de M. Biganzoli et Mme Crouzet, de l'INSA Toulouse. 


Les prémices de ce travail viennent d'un article scientifique,  _Pencil Drawn Strain Gauges and Chemiresistors on Paper, by Cheng-Wei Lin, Zhibo Zhao, Jaemyung Kim & Jiaxing Huang, Nature, published on January 22, 2014_ [1](https://www.nature.com/articles/srep03812), dans lequel est fabriqué un capteur de déformation à base d'une feuille de papier et d'un crayon à papier, avec une mine en graphite.. Le système granulaire que composent les particules de graphite étalées sur une feuille de papier par un crayon se comporte d'une manière intéressante : lorsque le papier est courbé, les particules de graphite se rapprochent ou s'éloignent, induisant une diminution ou une augmentation de la résistivité globale du "circuit électrique" ainsi créé. 


La grande difficulté vient de la résistivité de ce système, particulièrement élevée. Lorsqu'il est mélangé avec des molécules liantes pour qu'il soit moins friable, sa résistivité augmente fortement. Les crayons dans le commerce, des XB aux XH en passant par le standard HB, B pour les plus gras (bold) et H pour les plus durs (hard), avec X le niveau de gras ou de dureté associé (un 4B sera plus gras qu'un 2B et un 4H plus dur qu'un 2H), seront ceux que nous utiliserons. Dans cette classification, les plus gras comportent le plus de graphite et les plus durs le plus de molécules liantes. 
Cette différence de composition chimique et donc de dureté, est mise en évidence dans l'article par EDS _(energy dispersive spectroscopy)_, où les résultats suivants sont obtenus : 
- Plus on se rapproche du 9H, plus la proportion de liant est élevée. Les principaux éléments sont alors métalliques (Mg, Al) ou pseudo-métalliques (Si), avec également une forte teneur en oxygène. 
- A l'inverse, plus on se rapproche du 9B, plus la concentration en carbone augmente et plus celle des liants diminue.  
![image](https://user-images.githubusercontent.com/98756729/163597035-770cc0d2-381f-472a-9c6a-e3c83dd24306.png)
_Image ci-dessus : figure 2 de l'article : (a) EDS spectra of pencil leads correlating hardness with the fraction of carbon. Intensities of all of the spectra were normalized based on the carbon peak. (b–g) Optical microscopy images of traces drawn on the paper substrates from pencils of decreasing hardness._[1](https://www.nature.com/articles/srep03812)

L'équipe de chercheurs a par la suite utilisé ces différents crayons et tracé des jauges de contraintes en forme de U sur des feuilles de papier. Ces jauges présentent une longueur de trait d'environ quelques centimètres pour une largeur de trait de quelques millimètres, comme le montre la figure 3 (a) de l'article ci-dessous. 
Le mécanisme de rapprochement ou d'éloignement des différents grains du système granulaire y est également représenté, (b-c-d).


![image](https://user-images.githubusercontent.com/98756729/163599411-dad5cb92-1356-40c1-ab71-cd2118588d27.png)

_Image ci-dessus : figure 3 de l'article : (a) A photograph showing the U-shaped pencil trace drawn on a paper beam functioning as a strain gauge. (b) Schematic drawing shows that the number of connected graphite particle chains varies depending on the types of deformation. (c–d) Photograph of the gauge deformed by a single finger in compression and tension, respectively._[1](https://www.nature.com/articles/srep03812)

Les résistances obtenues sur ces dimensions par l'équipe de chercheurs sont alors les suivantes : 


| Crayon utilisé      | Résistance obtenue| 
| ------------- |:-------------:| 
| 9B     | 200 kOhms | 
| 6B     | 500 kOhms     | 
| 2B | 2 MOhms     |  
| HB | 20 MOhms |

Notons que l'article soutient que les résistances supérieures à 20 MOhms n'ont pas pu etre mesurées par l'équipe (un multimètre a été utilisé). Nous proposons alors de fabriquer un circuit électronique permettant de mesurer la variation de résistance relative à la déformation, afin d'obtenir un _flex sensor_ low-tech, open source et _user-friendly_. 

# 2. Circuit électronique <a class="anchor" id="Circuit_elec"></a>

Le circuit électronique que nous avons utilisé est un montage amplificateur à transimpédance, à amplificateur opérationnel. Afin de garantir une facilité d'utilisation, nous avons également ajouté un module Bluetooth qui nous permet, via une application réalisé avec le _MIT App Inventor_ de communiquer avec un téléphone portable android. Un potentiomètre digital commandé en SPI, monté en mode rhéostat à la place d'une résistance, nous permet de modifier le gain de l'amplificateur en temps réel. Nous avons également intégré un encodeur rotatoire, qui permet à l'utilisateur de faire des modifications en temps réel des actions du circuit, ainsi qu'un écran OLED qui affiche des informations utiles à l'utilisateur. Ce circuit électronique est monté sur PCB, puis monté sur un microcontroleur Arduino UNO. 

Liste du matériel : 

| Fonction     | Référence| 
| ------------- |:-------------:| 
| Microcontroleur | Arduino UNO |
| Amplificateur opérationnel à faible bruit     | LTC 1050 | 
| Module Bluetooth     | HC05    | 
| Module encodeur rotatoire  | GT055     | 
| Potentiomètre digital | MCP |
| Résistances | 270k, 100k, 10k, 33 ohms ...|
| Capacités | 100pF, 10uF ...|

Un schéma LTSpice du matériel est visible sur l'image ci-dessous, qui est fidèle au circuit tel que fabriqué sur le PCB. Par la suite cependant, nous introduirons plusieurs manières différentes de représenter notre _flex sensor_, notamment afin de tester l'impact du bruit :

![image](https://user-images.githubusercontent.com/98756729/163603875-e34973cb-3e47-418e-a51d-7911591c59d2.png)

La résistance {Rsensor} étant le _flex sensor_ et la résistance Rvar étant le potentiomètre digital, monté en série avec une résistance de 33 Ohms. La sortie Vout est reliée à une entrée analogique du CAN du microcontroleur arduino, qui traitera la donnée analogique brute afin d'en extraire des informations. 
Une analyse électrique du schéma précédent donne : 

- V+ = E*(R1//C1)/(Rsens+R5+(R1//C1))
- V- = Vout/(1+((R3//C4)+R6)/(R2+Rvar))
- Vout = E(R1//C1)(1+((R3//C4)+R6)/(R2+Rvar))/(Rsens+R5+(R1//C1)
, où E=5V. 

En utilisant la formule ci-dessus sur excel, on obtient : 

![image](https://user-images.githubusercontent.com/98756729/163655598-82f2908a-b775-4942-8c23-dc98f40e5833.png)

De l'autre coté, une analyse effectuée de la meme manière avec le logiciel spice donne : 

![image](https://user-images.githubusercontent.com/98756729/163655673-e3bae0f7-8292-4288-a0b7-24971c0b144c.png)

Où les instructions données sont : 
- **.step param Rvar 1k 51k 10k**
- **.step param Rsensor 1000k 20000k 1000k**
- **.op**

Nous remarquons les memes courbes : la fonction de transfert semble correcte. 

# 3. Schématique et PCB KiCad <a class="anchor" id="Schem"></a>

# 4. Code Arduino <a class="anchor" id="Code"></a>

# 5. Application APK Bluetooth <a class="anchor" id="App"></a>

# 6. Banc de test <a class="anchor" id="Banc"></a>

# 7. Datasheet <a class="anchor" id="Sheet"></a>


