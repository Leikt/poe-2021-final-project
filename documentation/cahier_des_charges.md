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
- openVPN
- nginx manuel: \
https://hub.docker.com/_/nginx
https://phoenixnap.com/kb/docker-nginx-reverse-proxy


OU
- nginx auto : \
https://hub.docker.com/r/jwilder/nginx-proxy
http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/

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
- jekyll : \
https://hub.docker.com/r/jekyll/jekyll
- jenkins: \
https://hub.docker.com/_/jenkins
- tomcat :\
https://hub.docker.com/_/tomcat
- gitlab : \
https://hub.docker.com/_/gitlab-community-edition
- django : \
https://hub.docker.com/_/django

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
- nfs-server : \
https://hub.docker.com/r/atlassian/nfs-server-test
- ftps

Réseau :
- POE (interne)