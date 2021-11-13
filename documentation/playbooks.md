# Utilisation des différents playbooks
## all_in.pb.yml
Ce playbook rassemble tous les playbook en un seul. Il permet donc de provisionner et de configurer tout le système.
Il lance les playbooks suivants:
- *provisionning.pb.yml*: sous condition que la variable *provides* est définie.

**Usage**
`ansible-playbook all_in.pb.yml [-e [provides=]]`

- `-e provides=`
Si la variable externe provides est définie (quelle que soit sa valeur), alors il crée de nouvelles instances dans un nouvel inventaire.
Cette opération ne supprime pas les anciennes instances.

**Exemples**
- `ansible-playbook all_in.pb.yml`\
Lance la configuration des instances existantes
- `ansible-playbook all_in.pb.yml -e provides=`\
Lance le provisionning de nouvelles instances et leur configuration.

## provisionning.pb.yml
Ce playbook assure le provisionning des instances nécessaire aux autres playbook. Il respecte les groupes et machines définis dans le fichier *roles/provisionning/vars/machines.yml*. De plus, un nouveau fichier *~/inventory.ini* sera créé au cour du provisionning.

Variables obligatoires : *region, subnet-id, image, type, groups*

Seule la variable groups est complexe. Elle doit respecter la syntaxe suivante :
```yml
groups:
  - name: nom du groupe 1
    machines:
      - name: nom de la machine 1 du groupe 1
        count: nombre de machine de ce nom à créer
```
Exemple:
```yml
groups:
  - name: frontend
    machines:
    - name: G4_frontend
      count: 1
```
### Prérequis
Pour pouvoir se connecter, l'utilisateur du playbook doit avoir un IAM possédant les permissions *AmazonEC2FullAccess* et *AdministratorAccess*. Rendez-vous dans le tableau de bord de IAM pour les modifications.

La clé publique de connexion sera stockée dans `~/aws_access/access_key` tandis que la clé privée sera dans `~/aws_access/secret_key`. Pour des raisons évidentes de sécurité, aucune de ces clés ne pourra être partagée sur le github de ce projet.