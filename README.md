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





# 2. Circuit électronique <a class="anchor" id="Circuit_elec"></a>

# 3. Schématique et PCB KiCad <a class="anchor" id="Schem"></a>

# 4. Code Arduino <a class="anchor" id="Code"></a>

# 5. Application APK Bluetooth <a class="anchor" id="App"></a>

# 6. Banc de test <a class="anchor" id="Banc"></a>

# 7. Datasheet <a class="anchor" id="Sheet"></a>


