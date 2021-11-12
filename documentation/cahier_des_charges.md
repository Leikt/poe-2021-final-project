# Cahier des charges
## Organisation du réseau
4 VM sur CentOS7 :

1. Ansible
    - Machine de maintenance
    - Master
2. Frontend
    - Reverse proxy
    - Endpoint VPN
3. Backend - Applications
    - application war
    - Jekyll
    - Gitlab
    - Django
    - Jenkins
4. Backend - Data
    - nfs
    - ftps

## Détail des machines
Distributions : centos pour tout le monde

### VM - Ansible
Pour l'aspect pratique, nous pourrons tous exécuter ansible depuis cette machine. Cela évite moult installation et configuration sur les machines hôtes.
Packages :
- python (via dnf)
- ansible (dernière version)
- git

Connexion :
- par ssh (dans un premier temps par mdp, durcit quand tous les membres auront les clés)

Réseau :
- Internet
- POE (interne)

Autres :
- clone du répertoire https://github.com/Leikt/poe-2021-final-project.git dans /data

### VM - Frontend
Point d'accès au réseau.

Package :
- python
- docker

Package python :
- docker-compose

Docker :
- nginx
- openVPN

Réseau :
- Internet
- POE (interne)
- VPN

### VM - Application
Héberge les applications demandées par le client.

Package :
- python
- docker

Package python :
- docker-compose

Docker :
- jekyll
- jenkins
- tomcat
- gitlab
- django

Connexion :
- par ssh via la machine Ansible uniquement

Réseau :
- POE (interne)

### VM - Data
Serveur de données pour les applications.

Package :
- python
- docker

Package python :
- docker-compose

Dockers :
- nfs-server
- ftps

Réseau :
- POE (interne)