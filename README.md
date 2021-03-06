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


## 1.1 Prémices 

Les prémices de ce travail viennent d'un article scientifique,  _Pencil Drawn Strain Gauges and Chemiresistors on Paper, by Cheng-Wei Lin, Zhibo Zhao, Jaemyung Kim & Jiaxing Huang, Nature, published on January 22, 2014_ [1](https://www.nature.com/articles/srep03812), dans lequel est fabriqué un capteur de déformation à base d'une feuille de papier et d'un crayon à papier, avec une mine en graphite.. Le système granulaire que composent les particules de graphite étalées sur une feuille de papier par un crayon se comporte d'une manière intéressante : lorsque le papier est courbé, les particules de graphite se rapprochent ou s'éloignent, induisant une diminution ou une augmentation de la résistivité globale du "circuit électrique" ainsi créé. 


La grande difficulté vient de la résistivité de ce système, particulièrement élevée. Lorsqu'il est mélangé avec des molécules liantes pour qu'il soit moins friable, sa résistivité augmente fortement. Les crayons dans le commerce, des XB aux XH en passant par le standard HB, B pour les plus gras (bold) et H pour les plus durs (hard), avec X le niveau de gras ou de dureté associé (un 4B sera plus gras qu'un 2B et un 4H plus dur qu'un 2H), seront ceux que nous utiliserons. Dans cette classification, les plus gras comportent le plus de graphite et les plus durs le plus de molécules liantes. 
Cette différence de composition chimique et donc de dureté, est mise en évidence dans l'article par EDS _(energy dispersive spectroscopy)_, où les résultats suivants sont obtenus : 
- Plus on se rapproche du 9H, plus la proportion de liant est élevée. Les principaux éléments sont alors métalliques (Mg, Al) ou pseudo-métalliques (Si), avec également une forte teneur en oxygène. 
- A l'inverse, plus on se rapproche du 9B, plus la concentration en carbone augmente et plus celle des liants diminue.  
![image](https://user-images.githubusercontent.com/98756729/163597035-770cc0d2-381f-472a-9c6a-e3c83dd24306.png)
_Image ci-dessus : figure 2 de l'article : (a) EDS spectra of pencil leads correlating hardness with the fraction of carbon. Intensities of all of the spectra were normalized based on the carbon peak. (b–g) Optical microscopy images of traces drawn on the paper substrates from pencils of decreasing hardness._[1](https://www.nature.com/articles/srep03812)

## 1.2 Jauge de contrainte et graphite 

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

## 2.1 Choix du matériel 


Liste du matériel : 

| Fonction     | Référence| 
| ------------- |:-------------:| 
| Microcontroleur | Arduino UNO |
| Amplificateur opérationnel à faible bruit     | LTC 1050 | 
| Module Bluetooth     | HC05    | 
| Module encodeur rotatoire  | KY-040-GT055     | 
| Potentiomètre digital | MCP41050 |
| Résistances | 270k, 100k, 10k, 33 ohms ...|
| Capacités | 100pF, 10uF ...|


## 2.2 Schématisation du circuit électronique et modifications apportées


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

## 2.3 Test de la validité du modèle électrique 

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

![image](https://user-images.githubusercontent.com/98837571/165268137-7f9ab7d5-3c17-4ebd-8542-ec8b4e11c8b0.png)
![image](https://user-images.githubusercontent.com/98837571/165269024-4a0505c3-1e3d-453a-8db1-2e5d67628108.png)


* Ecran OLED

![image](https://user-images.githubusercontent.com/98837571/165267939-e8e0c9ba-df2f-4c79-9d11-f493763f63e3.png)
![image](https://user-images.githubusercontent.com/98837571/165269110-a40f5d81-976a-42b6-a3f9-845fed1024e8.png)


* Module Bluetooth HC-05

![image](https://user-images.githubusercontent.com/98837571/165268242-bbcf3e92-ebce-41e4-981c-e9a67c6d46bf.png)
![image](https://user-images.githubusercontent.com/98837571/165269517-beef8d9d-3604-49fb-a9c1-d489c072345a.png)


* Potentiomètre 

![image](https://user-images.githubusercontent.com/98837571/165268038-6818a06d-c74a-46b9-8194-b3332b7e5815.png)
![image](https://user-images.githubusercontent.com/98837571/165269395-d6ab532f-c13c-4dba-b70f-6eae3144ebfc.png)


* Amplificateur opérationnel LTC 1050

![image](https://user-images.githubusercontent.com/98837571/165268374-0c4e93f3-1092-446f-b92b-47597407adc3.png)
![image](https://user-images.githubusercontent.com/98837571/165269643-b6a660a1-44df-4bb8-aeb4-38eae84c1cc3.png)

Et voici la schématique complète de notre circuit, ainsi que les correspondances entre les PINS des composants et de l'Arduino :

![image](https://user-images.githubusercontent.com/98837571/165268542-d8a14658-2672-4300-8002-474ff12c105e.png)
![image](https://user-images.githubusercontent.com/98837571/165268861-204d1e40-793f-42cd-b8a5-b923cac574f9.png)


## 3.2 Réalisation des pistes et placement des composants

C'est cette étape qui nous a demandé le plus de temps et d'attention. En effet, nous avons eu quelques difficultés à relier les PINS de manière satisfaisante et pour cela nous avons fait appel à deux vias.

![image](https://user-images.githubusercontent.com/98837571/165270097-96cd676b-efea-45f5-adde-c4f06a3fba9b.png)

Nous avons fait appel à la visualisation 3D pour vérifier que les composants se plaçaient bien et n'entraient pas en conflit.

![image](https://user-images.githubusercontent.com/98837571/165270822-01621169-a109-4a41-8d5e-267f5c6b9d21.png)
![image](https://user-images.githubusercontent.com/98837571/165270975-5daf9c3a-f7b0-4674-9b6c-dee6233b2ea1.png)

Malheureusement, nous n'avions pas prévu que l'encodeur rotatoire et le module Bluetooth soient placés sur des headers courbés, ce qui représentera un problème par la suite.

## 3.3 Fabrication du SHIELD

Nous avons fabriqué notre PCB sur une plaque d'epoxy protégée par une couche fine de cuivre. Pour cela, nous avons imprimé notre PCB sur un calque pour qu'ensuite, à l'aide d'une insolation UV, l'empreinte soit reproduite sur notre plaque et jouant le rôle d'une résine protectrice. Puis, nous avons placé notre plaque dans une solution de perchlorure de fer. Ainsi, le cuivre non recouvert de résine est éliminé et nous obtenons notre PCB.
Ensuite, nous avons percé (1mm pour les headers et connecteurs de l'Arduino et 8mm pour le reste) et soudé les éléments composant notre PCB.
C'est à cette étape que nous nous sommes rendus compte du problème de l'encodeur et du module Bluetooth et avons donc coupé les pattes de l'encodeur pour le soûder dans l'autre sens, et ainsi avoir la place de le placer sur le PCB.
Aussi, nous avons réalisé avoir inversé les PINS SDA et SCL de l'OLED sur l'Arduino et donc avons corrigé cela.

# 4. Code Arduino <a class="anchor" id="Code"></a>

Dans cette partie, est détaillé le code Arduino utilisé pour mener à bien le projet. Le code est intégralement retranscrit, et également sous forme de logigramme. 

## 4.1 Structure générale 

La structure générale est comme suit : 
- Une partie de déclaration de variables globales et de définitions
- Une partie de Setup (code qui ne s'exécute qu'une fois) 
- Une partie Loop qui s'exécute en boucle 

![Logigramme1_base1](https://user-images.githubusercontent.com/98756729/166296630-03c59207-8961-495b-979e-fc7be83782bc.JPG)

*figure ci-dessus : schéma récapitulatif de la structure du code Arduino* 

Egalement, sont présents des fonctions supplémentaires (d'interruption par exemple). Nous y viendrons ultérieurement. 

## 4.2 Déclaration de variables globales, définitions 

La première partie est donc une partie de déclaration de variables, et de définitions qui seront utiles dans le Loop et dans le Setup. Nous appellons cette partie le PRE-SETUP. La structure de notre code est : 

![Pre-setup 1](https://user-images.githubusercontent.com/98756729/166297008-03cd6105-e0be-44a9-9729-9b8cf22fc632.JPG)

*figure ci-dessus : schéma récapitulatif de la structure de notre code PRE-SETUP. 
*- Variables globales : Résistances, Pins ... 
*- Définitions : libraires, fichiers à utiliser 

![global1](https://user-images.githubusercontent.com/98756729/166297380-1b8b0fb4-7a7b-44ad-b9da-8dd3641ea5c1.JPG)
![global2](https://user-images.githubusercontent.com/98756729/166297431-8906d342-7572-4e46-8909-c7eefad4c0a5.JPG)

Les deux images ci-dessus rassemblent les éléments précédemment cités. Chaque utilité est brièvement rappelée en commentaire (//). 

## 4.3 Setup 

Le setup est organisé comme suit : 

![init_setup](https://user-images.githubusercontent.com/98756729/166297663-87e8ab62-5ac7-4a35-90e6-84163a9e3018.JPG)

Le code associé est le suivant : 

![setup](https://user-images.githubusercontent.com/98756729/166297804-edf92ec7-173b-433e-9c22-54f0115b687b.JPG)


## 4.4 Loop 

La troisième partie du code est le loop, la partie du code qui re-boucle sans arret, et est juste arretée momentanément par les interruptions; ici la fonction d'interruption doEncoder utilisée pour l'encodeur rotatoire (en bleu sur le schéma ci-dessus). 

Structure du loop : 

![LOOP1](https://user-images.githubusercontent.com/98756729/166298055-89d58068-5231-445c-96c5-743bbe3875ba.JPG)

### 4.4.1 Ajustement proportionnel du gain 

La structure *void loop* commence avec l'ajustement proportionnel du gain de notre montage amplificateur pour obtenir une tension de 2,5 V en guise de Vout. Cette adaptation nous permet de rester dans une plage d'utilisation convenable. Elle fonctionne en augmentant ou diminuant la valeur de consigne (entre 0 et 255) donnée au potentiomètre digital et donc respectivement diminuer ou augmenter la résistance, respectivement diminuant ou augmentant le gain du montage.
Bien évidemment, nous avons fait en sorte que la valeur de consigne envoyée au potentiomètre digital reste entre 0 et 255 compris; pour ne pas poser de problèmes. 
Enfin, la résistance actuelle de R2, ajustée, nous permet de calculer la véritable valeur de résistance du capteur Rs. Avec cette méthode, nous avons une valeur qui se stabilise rapidement autour de la valeur réelle de résistance souhaitée tout en s'assurant que la tension à l'entrée du convertisseur analogique numérique de l'arduino reste autour de 2,5V. 

Afin d'augmenter la vitesse de réponse, nous avons implémenté une correction proportionnelle de la position du wiper de l'encodeur rotatoire. dV, la différence de tension entre les 2,5V de consigne (Vconsigne) et la tension effectivement mesurée analgoRead(PotPin) (Vmesuré), est multipliée par un coefficient (5,0), puis convertie en entier et c'est de cette valeur qu'est augmentée ou diminuée la position du wiper. En somme, au lieu de faire un déplacement incrémental unique de la position du wiper, ou meme de faire un déplacement important mais toujours constant de la position du wiper, le système adapte le déplacement à la valeur souhaitée, résultant en un système beaucoup plus rapide. 

Ci-dessous un schéma qui récapitule le fonctionnement de notre code : 

![Correcteur_proportionnel3](https://user-images.githubusercontent.com/98756729/166300129-c969759f-2301-4791-812c-047fc608ed6a.JPG)


Le code associé est : 

![Pot_digital](https://user-images.githubusercontent.com/98756729/166300240-790ebc7e-f078-4ba2-b447-f92cda32e4dd.JPG)
![Pot_digital_2](https://user-images.githubusercontent.com/98756729/166300264-a9d68a02-a464-4b29-86ef-961a14c89b78.JPG)

### 4.4.2 Lecture de la valeur de tension 

Afin que la boucle correctrice fonctionne, et que la valeur de résistance lue puisse varier, on vient lire à chaque tour de boucle la tension en sortie du montage amplificateur, puis transformer cette valeure en valeur de résistance (avec la formule du gain précedemment énoncée). Le code est : 

![Capteur](https://user-images.githubusercontent.com/98756729/166300600-7b715cd6-8417-440d-9b4e-0abf7a19dbe8.JPG)

La valeur de R2 varie à chaque tour de boucle en raison de l'action stabilisatrice de la résistance du potentiomètre digital, et la valeur de Vadc varie à chaque tour en conséquence (et une mesure est effectuée à chaque tour). La valeur de Rs se stabilise donc autour de la valeur vraie. 

### 4.4.3 Interruption de la boucle LOOP & debouncing associé : encodeur rotatoire 

Une interruption de la boucle loop est effectuée lorsqu'un changement de la valeur de l'encodeur rotatoire est détecté sur le pin d'interruption du microcontroleur. Cette interruption est agrémentée d'un *debouncing*, c'est-à-dire que les variations lues par le microcontroleur ne sont prises en compte que si elles sont suffisamment espacées les unes des autres. 

Ici, la fonction d'interruption lit un temps, regarde si ce temps est assez éloigné du temps de la dernière interruption (>150ms). Si c'est le cas, la fonction remplit sa mission (elle change la valeur du Scale pour l'envoi de la donnée vers le module Bluetooth et l'application APK). Si ce n'est pas le cas, la fonction ne fait rien et le programme repart dans la boucle LOOP, mettant fin *de facto* à l'interruption. Cette fin d'interruption s'accompagne d'une mesure du temps, afin de mettre à jour la date de la dernière interruption qui sert à la comparaison. Le système de debouncing ainsi crée permet de se débarrasser des changements intempestifs lus par le pin arduino dus au bruit. Ce système est réglé par défaut à 150 ms de temps, mais il serait possible de changer cette valeur. 

Ci-dessous un schéma récapitulatif de cette fonction : 

![Debouncing_encodeur2](https://user-images.githubusercontent.com/98756729/166455194-024f46fb-dd9d-4ae2-8a8e-654f4721295d.JPG)


Et le code associé :

![interruption_encodeur_rotatoire](https://user-images.githubusercontent.com/98756729/166455261-50fd4e6d-9e38-4aab-88dd-b78a2460731c.JPG)


Comme vous pouvez le voir, cette fonction d'interruption change la valeur de la variable *Scale* qui permet de faire un *mapping* de la valeur de résistance envoyée à l'application APK vie Bluetooth (c'est à dire de choisir de contraintre l'envoi de la donnée dans certaines limites, changeant ainsi le "zoom" de la donnée autour d'une valeur particulière, ici définie à 5 MOhm). 

### 4.4.4 Mapping de la donnée et envoi à l'application Bluetooth

Dans le code suivant, la donnée, comprise entre 0 et 10 000 (unité kOhm), est envoyée en la centrant autour de 5 000 (kOhm) en fonction de la valeur du Scale, via la fonction constrain(), vers un entier compris entre 0 et 127. 

- Si la résistance varie beaucoup, l'utilisateur peut choisir de placer la variable Scale à 1 (en tournant l'encodeur rotatoire dans le sens horaire pour augmenter la valeur de scale, antihoraire pour la diminuer) et ainsi profiter d'une plage allant de 0 à 10 000 (kOhm). 
- Si la variation est plus faible au contraire, la valeur de résistance est contrainte dans un intervalle plus faible (entre 4000 et 6000 kOhm si Scale est à 5 par exemple). 

La valeur ainsi obtenue est donc plus ou moins zoomée sur l'application APK : la valeur envoyée est toujours comprise entre 0 et 127 (conformément aux egigences de l'application) mais les limites inférieure et supérieures correspondent à des résistances plus ou moins espacées (d'une plage de 10MOhm à 1Mohm). 

Le code qui y est associé est : 

![mapping1](https://user-images.githubusercontent.com/98756729/166456840-aea65dc8-c5c9-467e-8447-5de581c26881.JPG)


La valeur de la variable scale ainsi choisie permet donc de contraindre la donnée et de l'envoyer sous un format utilisable par l'application, avec le code suivant : 

![mapping2](https://user-images.githubusercontent.com/98756729/166457220-01c535e4-074e-46f8-bdc0-c3c96befc13c.JPG)

### 4.4.5 Affichage sur l'écran OLED des informations 

Ensuite, on affiche les différentes valeurs utiles sur l'écran OLED :
- la résistance, convertie en kOhm, 
- la valeur de position du wiper du potentiomètre digital, comprise entre 0 et 255 
- la valeur de la variable *scale* et donc le zoom effectif de l'affichage sur l'application APK

Le code est :

![OLED_et_affichage](https://user-images.githubusercontent.com/98756729/166457439-8e8077ab-a244-48f8-99f7-964f53f1c0a6.JPG)

Enfin, un délai de 300 ms entre deux tours de boucle LOOP est pris. 

# 5. Application APK Bluetooth <a class="anchor" id="App"></a>

Nous avons réalisé une application Android recevant les données de résistance de notre capteur via le module Bluetooth HC-05, qui affiche les données et trace le graphique de l'évolution de la résistance en fonction du temps. Pour cette dernière fonctionnalité, nous avons réalisé un mapping de la mesure dans le code Arduino.

# 6. Banc de test <a class="anchor" id="Banc"></a>

Pour tester notre capteur et réaliser sa datasheet, nous avons réfléchi à plusieurs protocoles. Cependant, seulement un nous a permis d'obtenir des résultats cohérents. 
Nous avons fabriqué différents capteurs avec des sections différentes à l'aide d'un crayon HB comme ceci :

![image](https://user-images.githubusercontent.com/98837571/167938092-dc75c850-b9b5-4d76-a986-0ff609e11e5e.png)

Ensuite, nous avons inséré notre capteur dans des cercles en papier avec des rayons différents, pour que notre capteur subisse des compressions avec des rayons de courbure différents : 

![image](https://user-images.githubusercontent.com/98837571/167939365-55915d58-dc30-4b7c-b914-f7dc06e29bee.png)

![image](https://user-images.githubusercontent.com/98837571/167939484-44f70075-1438-4bac-8c04-3848f7cdd517.png)

Nous avons ainsi pu effectuer plusieurs mesures de résistance en fonction du rayon de courbure et tracer son évolution en fonction du rayon : 

![image](https://user-images.githubusercontent.com/98837571/167940541-c9a5ea9f-ed73-4253-a889-6c343bf08a3a.png)

On observe bien que l'écart relatif de la résistance diminue avec l'augmentation du rayon de courbure, et donc que plus le capteur est comprimé, plus la résistance est faible.
Nous avons aussi réalisé des capteurs avec un crayon 2H, mais nous n'avons pas obtenu de résultats cohérents, les résistances à mesurer étant bien plus supérieures à la plage de mesure de notre capteur (1 - 10 Mohm).


# 7. Datasheet <a class="anchor" id="Sheet"></a>

La datasheet précise les caractéristiques de notre capteur ainsi que son environnement et son utilisation.
