# POE Ingénieur Système Unix Scripting - Projet final
A la suite de la formation, nous avons été chargés de réalisé un projet mobilisant l'ensemble des connaissances et compétences acquises. Ce repertoire contient tous fichiers textuels (scripts, documentation, configuration...)
## Généralités
### Durée du projet
Date de début : 12 novembre 2021

Date de fin : 18 novembre 2021

Présentation : 18 novembre 2021
### Membres du projet
* Soufyane Lamgari
* Quentin Le Rouge De Querdavid
* Mathilde Guiltat
* Robin LIORET
### Principaux logiciels utilisés
* Github : VCS, wiki
* PyCharm Community : Edition des codes ([Téléchargement](https://www.jetbrains.com/fr-fr/pycharm/download/))
* VirtualBox : Machines virtuelles
* Docker : gestion des containers
* Discord : communication
## Utiliser ce répertoire
Sur une nouvelle instance :
1. Installer git
````shell
sudo yum install -y git
````
2. Lancer
```shell
git clone https://github.com/Leikt/poe-2021-final-project.git
source poe-2021-final-project/scripts/init_master
```
3. Pour lancer le playbook principal avec provisionnement
````shell
./run development main.pb.yml -e provides=
````
Cela va créer les VM et les paramétrer.
4. Une fois le projet gitlab créé, il faut créer un runner. Pour cela :
````shell
./run development gitlab-runners.pb.yml -e url=<gitlab_url> -e token=<project_token>
````