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
| Potentiomètre digital | MCP41050 |
| Résistances | 270k, 100k, 10k, 33 ohms ...|
| Capacités | 100pF, 10uF ...|

Une représentation 3D de notre PCB est visualisable sur les images ci-dessous, issues du logiciel Kicad : 

![Capture8](https://user-images.githubusercontent.com/98756729/163666735-4f1563f3-0338-48c6-91cc-de7d47e3611a.JPG)![Capture9](https://user-images.githubusercontent.com/98756729/163666749-3001ceca-4579-4795-9974-90232d0164d8.JPG)



Un schéma LTSpice du matériel est visible sur l'image ci-dessous, qui est fidèle au circuit tel que fabriqué sur le PCB. Par la suite cependant, nous introduirons plusieurs manières différentes de représenter notre _flex sensor_, notamment afin de tester l'impact du bruit :

![image](https://user-images.githubusercontent.com/98756729/163603875-e34973cb-3e47-418e-a51d-7911591c59d2.png)

La résistance {Rsensor} étant le _flex sensor_ et la résistance Rvar étant le potentiomètre digital, monté en série avec une résistance de 33 Ohms. La sortie Vout est reliée à une entrée analogique du CAN du microcontroleur arduino, qui traitera la donnée analogique brute afin d'en extraire des informations. 
Une analyse électrique du schéma précédent donne : 

- V+ = E*(R1//C1)/(Rsens+R5+(R1//C1))
- V- = Vout/(1+((R3//C4)+R6)/(R2+Rvar))
- **Vout = E(R1//C1)(1+((R3//C4)+R6)/(R2+Rvar))/(Rsens+R5+(R1//C1)**
, où E=5V. 

On remarque que :

• R5 en entrée protège l'ampli opérationnel contre les décharges électrostatiques, et
forme avec C1 un filtre pour les bruits en tension
• C1 et R1 forment un filtre pour le bruit en courant
• R2 est adaptable avec le potentiomètre digital, pour changer le calibre
• C4 et R3 forment un filtre actif
• C2 et R6 forment le filtre de sortie
• C3 filtre le bruit d'alimentation

Dans notre cas, la seule modification permanente est l'ajout d'un potentiomètre digital dont la résistance varie entre 500 Ohms et 51800 Ohms environ, et le remplacement de R3 par une résistance plus élevée (270 kOhms) afin d'augmenter le gain possible par notre montage. En effet, comme nous l'avons vu avec la formule précedente, la tension de sortie est à peu près proportionnelle à 1+R3/Rvar et donc augmenter R3 nous permet d'augmenter le gain. Le potentiomètre digital est commandé sur 8 bits et donc peut prendre 256 valeurs de résistance régulièrement espacées, environ de 200 Ohms les unes des autres. Le milieu de cette plage de fonctionnement étant environ à 25 kOhms, nous avons décidé d'augmenter R3 afin d'avoir, en conditions "nominales" un gain d'environ 11. Rappelons que le gain conseillé était de 100. Il nous est possible d'arriver à cette valeur de gain, mais il faut pour cela imposer une résistance d'environ 2,7kOhms au potentiomètre digital, ce qui n'arrive qu'à environ le dixième de sa plage utilsable. Une solution, afin de toujours repousser les limites de ce gain, est d'augmenter la valeur de R3 et diminuer celle de Rvar, mais on se heuret à d'autre problèmes rencontrés lorsque les résistances sont très élevées.  


Une autre solution, plus couteuse, serait d'adjoindre un étage amplificateur inverseur à la suite d'un amplificateur transimpédance : nous n'aurions pas besoin de résistances élevées. 

Testons notre formule pour le gain. En utilisant la formule **Vout = E(R1//C1)(1+((R3//C4)+R6)/(R2+Rvar))/(Rsens+R5+(R1//C1)** sur excel, on obtient : 

![image](https://user-images.githubusercontent.com/98756729/163655598-82f2908a-b775-4942-8c23-dc98f40e5833.png)

De l'autre coté, une analyse effectuée de la meme manière avec le logiciel spice donne la courbe ci-dessous, où on voit la tension de sortie Vout en fonction de la résistance du capteur pour différentes valeurs de résistance imposées par le potentiomètre digital. 

![image](https://user-images.githubusercontent.com/98756729/163655673-e3bae0f7-8292-4288-a0b7-24971c0b144c.png)

Où les instructions données sont : 
- **.step param Rvar 1k 51k 10k**
- **.step param Rsensor 1000k 20000k 1000k**
- **.op**

Ces instructions ordonnent au logiciel SPICE de calculer l'**operating point**, le point d'équilibre du circuit et sa valeur de tension de sortie associée. Nous remarquons les memes courbes que pour le calcul excel : la fonction de transfert écrite ci-dessus semble correcte. Au-delà de cela, on remarque que des valeurs précises de résistances imposées par le potentiomètre digital sont nécessaires pour garder la tension de sortie *Vout* dans une fourchette facilement utilisable par l'entrée analogique du microcontroleur arduino. Nous verrons plus tard qu'une solution de réglage automatique du gain a été mise en oeuvre et testée, et les résultats qu'elle produit. 
Nous remarquons que les variations de tensions de sortie ne répondent pas linéairement aux variations de résistance du capteur. En particulier, deux problèmes se posent : 

- Pour des résistances faibles et des gains forts, la tension de sortie dépasse rapidement les 5V et le capteur sature. Cet effet devient prégnant pour des résistances de valeurs faibles (inférieures au MOhm) et la résistance du potentiomètre digital faible également. Un réglage du potentiomètre digital à de très grandes valeurs de résistance permet de contourner ce problème en diminuant le gain. 
- Pour des résistances de capteur élevées et des gains forts, on remarque un aplatissement de la courbe, *i.e.* une variation importante de résistance du capteur (une déformation importante) s'accompagne d'une variation faible de tension de sortie Vout. Cela pose un problème du à la mesurabilité d'une variation de tension, qui n'est pas assurée pour des variations faibles. Rappelons que le quantum de variation pour un microcontroleur Arduino UNO avec un *CAN* de 10bits est d'environ 5mV (5mV/2^10 = 4,88 mV). Des variations inférieures à 5mV ne sont donc pas mesurables, d'autant plus que du bruit apparait et augmente encore la difficulté de la mesure. 
- Un troisème problème est celui de la précision du potentiomètre digital. Un bref calcul indique que 200 ohms d'écart entre deux valeurs de Rvar impose une différence de G = (1+(R3+R6)/(R2+Rvar)) de 0,09 environ à Rvar = 25k, et 8,09 environ à Rvar = 2,5k, soit respectivement 0,74% et 7,8% du gain. Cette différence n'est pas négligeable et doit etre prise en compte lors de la détermination de la mesure. En somme, on essaiera au maximum de se placer dans une zone où cette différence à le moins d'impact, donc à des gains plus faibles. 

1) Conditions nominales d'utilisation. 

En somme, **plus la résistance du capteur augmente, plus ses variations deviennent difficiles à mesurer**. Ces éléments nous permettent de répondre à la première question, celle de tester les **conditions nominales** du capteur. 
Afin de garantir une mesure plus ou moins précise, la condition nominale d'utilisation du capteur sera dans une plage de résistannces de **1 à 10 MOhms** environ. Au-delà, il deviendra impossible d'ajuster en temps réel la valeur du potentiomètre digital avec suffisamment de précision pour ne pas compromettre la mesure. Il sera donc nécessaire de fixer sa valeur. La limite sera alors les 5mV de quantum de variation détectable par l'Arduino, et évidemment, le bruit qui subsistera. 
Un test empirique sur des résistances connues, de 1 et 10 MOhm, nous a permis de nous convaincre de la précision de la mesure, et de raisonnablement croire à la validité de cette plage de résistances. 

2) Influence de l'*offset voltage* imposé par l'amplificateur LTC1050

Une analyse sur Spice de l'offset existant imposé par l'amplifacteur LTC1050 permet d'estimer son effet. En agissant à tension différentielle nulle, l'amplificateur impose un offset qui se propage jusqu'à la tension Vout. Cet effet, implémenté sur Spice, nous permet de raisonner sur la viabilité du montage. 

![Voffset_Capture](https://user-images.githubusercontent.com/98756729/163668570-4933808c-9583-4c84-95fb-2d2a5eb38e54.PNG)

On remarque des tensions d'offset dépendant de la résistance variable Rvar. Ces tensions d'offset sont relativement importantes, de 100 à 200mV. Examinons, à Rvar constante, l'impact d'une variation de tension dV, à basse fréquence. On constate : 

![image](https://user-images.githubusercontent.com/98756729/163715485-79b7af2a-337e-4e12-be21-7ae386998964.png)


*Figure ci-dessus : Tension de sortie en entrée court-circuitée en fonction de la valeur de la résistance variable* 


Soit :
- Rsensor = (E.R1.(1+R3+R6)./(Vout.(R2+Rvar)))-R5-R1
- E=5V
On a alors :
- dR/Rsensor(dV,Vout)= (Rsensor(Vout + dV)-Rsensor(Vout))/Rsensor(Vout) = A*(1-Vout/(Vout+dV))/(A-Vout.(R5+R1))
- avec A=E.R1.(1+R3+R6)/(R2+Rvar) 


Plusieurs dV sont possibles :
- dV = 5/1023 V (pas de quantification) 
- dV correspondant à l'offset, dépendant de Rvar 

On constate une erreur d'offset très importante par rapport à l'erreur de quantification. On a également une variabilité importante de cet offset par rapport à la résistance du potentiomètre digital en mode rhéostat. En somme, si elle est négligeable pour l'utilisation du capteur dans une large plage de tensions, pour une meme résistance, le passage d'une résistance à une autre est à controler. 

# 3. Schématique et PCB KiCad <a class="anchor" id="Schem"></a>

La réalisation du PCB a demandé plusieurs étapes de conception, allant de la schématique jusqu'à la soudure, en passant par le tracé des pistes sur la carte. Nous allons maintenant détailler le fruit de notre travail sur cette partie.

## 3.1 Symboles, empreintes et schématique

Voici les symboles et empreintes réalisés pour les différents éléments composant notre PCB :

* Encodeur rotatoire

* Ecran OLED

* Module Bluetooth HC-05

* Potentiomètre 

* Amplificateur opérationnel LTC 1050

Et voici la schématique complète de notre circuit :


## 3.2 Réalisation des pistes et placement des composants

C'est cette étape qui nous a demandé le plus de temps et d'attention. En effet, nous avons eu quelques difficultés à relier les PINS de manière satisfaisante et pour cela nous avons fait appel à deux vias.



Visualisation 3D

## 3.3 Fabrication du SHIELD


# 4. Code Arduino <a class="anchor" id="Code"></a>

# 5. Application APK Bluetooth <a class="anchor" id="App"></a>

# 6. Banc de test <a class="anchor" id="Banc"></a>

# 7. Datasheet <a class="anchor" id="Sheet"></a>


