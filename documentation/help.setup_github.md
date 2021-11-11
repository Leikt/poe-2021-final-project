# Configurer Git et Github
Afin de versionner son projet, nous pouvons utiliser Git et GitHub. Le premier est un outil de versionnage, le second une plateforme de développement et de partage de code.
## Préparation
- Installez le package `git`
- Allez dans le dossier contenant vos clés ssh (sur linux : `cd ~/.ssh/`) ou créez-en un.
- Générez une nouvelle clé ssh :
```bash
ssh-keygen -t rsa -b 4096 -f github -N "votre_passphrase" -C "votre_adresse@email.com"
```
- Ajoutez la clé à votre agent SSH pour ne pas avoir à la spécifier à chaque fois. Il ira la chercher automatiquement :
`ssh-add github`
  - Si la commande vous dit que la connexion à l'hôte n'a pas pu être établie. Lancez la commande :
```bash
eval `ssh-agent -s`
```
- Ouvrez le fichier `github.pub` et copiez le contenu : nous allons ajouter la clé publique à GitHub.
- Ouvrez votre navigateur et allez sur votre compte GitHub : [https://github.com/](https://github.com/). Si vous n'avez pas de compte, créez-en un : c'est gratuit et utile pour la suite de votre carrière.
- Cliquez ensuite sur l'icone de votre profile en haut à droite > Settings > SSH and GPG keys.
	- Vous voyez le gros bouton "New SSH key" ? Cliquez dessus.
	- Donnez lui le nom que vous voulez (perso j'utilise le hostname de ma machine) il faut juste que vous sachiez de quelle machine vient la clé.
	- Dans le grand encart "Key", collez le contenu de `github.pub`

C'est setup. Testons tout ça :
`ssh -vT git@github.com`
Pour info : 
- `-v`      Verbose mode.  Causes ssh to print debugging messages about its progress.  This is helpful in debugging connection, authentication, and configuration problems.  Multiple -v options increase the verbosity.  The maximum is 3.
- `-T`      Disable pseudo-terminal allocation.

Après une belle cascade d'info, vous devriez avoir : 
```md
Hi Leikt! You've successfully authenticated, but GitHub does not provide shell access.
debug1: channel 0: free: client-session, nchannels 1
Transferred: sent 3552, received 3384 bytes, in 0.2 seconds
Bytes per second: sent 17648.8, received 16814.0
debug1: Exit status 1
```
(Leikt, c'est moi)

Vous pouvez désormais accéder à github par SSH.
## Création du repo
Il y a plusieurs façons de créer un nouveau repo github :
- Partir du repertoire local et le pousser (push) vers GitHub
- Partir d'un répertoire GitHub et le tirer (pull) vers le local

Si j'ai le choix, c'est-à-dire que je dois créer ce nouveau répertoire depuis zéro, je préfère partir de GitHub qui assiste la création :
- Dans votre compte github, cliquez sur l'icone GitHub en haut à gauche (cela vous ramenera à votre dashboard).
- Puis cliquez sur le bouton "New"
- Laissez-vous guider pour la création d'un nouveau repertoire.
- Une vois créer, vous arriverez sur la page du repo. Il y aura plein d'info, mais pour le moment : une seule nous intéresse.
	- Cliquez sur le gros bouton "Code" (pas l'onglet mais le bouton)
	- SSH
	- Copier l'adresse SSH qui s'affiche et qui devrait ressembler à `git@github.com:Leikt/poe-ansible-1.git`
- Retournez dans votre terminal sur la machine local. Assurez-vous d'être dans le répertoire où vous voulez mettre le projet (un dossier pour le projet sera créé automatiquement)
- Lancez la commande 
`git clone git@github.com:Leikt/poe-ansible-1.git`
En mettant bien sûr votre addresse ssh à la place de la mienne.

Et voilà ! Votre projet est cloné ! Vous pouvez utiliser git avec github comme vous le voulez.

## Notes
- `git push` permet de pousser le projet vers le répertoire github (la synchro n'est pas automatique)
- La plupart des IDE (Visual Studio Code, PyCharm...) offre la possibilité de gérer les repertoire gittés et c'est bien plus agréable que de le faire à la main...
