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
Sur une nouvelle instance et dans le répertoire de l'utilisateur.
1. Si des VMs ont déjà été créé avec l'utilisateur IAM, copier la clé aws.pem dans .ssh
2. Créer un dossier aws_access ainsi que deux fichiers :
   - aws_access/access_key contenant la clé publique du profil IAM
   - aws_access/secret_key contenant la clé privée du profil IAM
3. Lancer (copier / coller la commande)
```shell
sudo yum install -y git;\
git clone https://github.com/Leikt/poe-2021-final-project.git;\
sudo ./poe-2021-final-project/scripts/init_master $USER
```
3. Pour lancer le playbook principal avec provisionnement.
````shell
./run development main.pb.yml -e provides=
````
Cela va créer les VM et les paramétrer. Retirer `-e provides=` pour effectuer une reconfiguration.
4. Une fois le projet gitlab créé, il faut créer un runner. Pour cela :
````shell
./run development gitlab-runners.pb.yml -e url=<gitlab_url> -e token=<project_token>
````

Les ip (locales) des différentes machines se trouvent dans le fichier ~/inventory.ini