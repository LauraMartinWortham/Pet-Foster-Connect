# INSTALLATION du projet sur un serveur

- Depuis le serveur cloner le repo 
- cd dans le repo local
- chmod +x ./scripts/installation.sh --> Donne les droits d'execution au script d'installation
- ./scripts/installation.sh
  - accepter quand demandé (Y)
  - CERTBOT : suivre les instructions 
    - Entrer le nom de domaine sur lequel le site sera hosté (attention à bien le répercuter sur nginx.config) 
  - La machine va redémarrer

- Revenir en SSH sur la machine
- retourner dans le dossier du projet
  - touch .env
  - éditer le .env avec les bonnes variables (avec nano, Vim, etc..)
- docker compose up


# Docker

Nous avons deux services qui sont lancés par Docker compose :
    - le container pfc-application : basé sur une image de node et qui fait tourner le serveur web
    - le container pfc-databse : basé sur une image postgres et qui fait tourner le service de BDD

Les scripts d'initialisation de la BDD ne se lanceront que si celle ci n'existe pas, si les scripts d'initialisation ont été modifiés il faut supprimer le volume docker. Pour cela
`docker volume ls` --> lister les volumes
`docker volume rm {nom du volume a supprimer}` --> supprimer le volume concerné (ici pg-pfc)