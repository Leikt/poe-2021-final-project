# Setup une connexion ssh comfortable
Pour se connecter à une vm aws de façon classique, il faut une commande du genre : `ssh -i ~/.ssh/aws_key -p 2021 sysadmin@ec2-18-230-64-164.sa-east-1.compute.amazonaws.com`.
C'est long et peu clair. Il serait tellement plus pratique de pouvoir faire `ssh my_aws`. Voyons comment arriver à ce confort :

1. Ouvrir le fichier ~/.ssh/config (il n'existe pas forcément)
2. Ajouter les lignes suivantes : 
```
Host <nom>
    Hostname <addresse server>
    User <nom utilisateur>
    Port <port>
    IdentityFile <clé privée>
```
Avec :
- `<nom>` le nom que vous voulez donner à votre serveur. Dans notre exemple : `my_aws`
- `<nom d'utilisateur>` l'utilisateur auquel vous vous connecter. Dans notre exemple : `sysadmin`
- `<port>` le port utilisé pour la connexion. Dans notre exemple `2021`
- `<clé privée>` le chemin vers la clé privée utilisée. Dans notre exemple `~/.ssh/aws_key`

Une fois cela fait, lancez la commande `ssh my_aws` (ou votre nom de serveur). La magie opère.