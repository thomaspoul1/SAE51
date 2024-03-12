#!/bin/bash

# Installation de Docker
sudo ./installdocker.sh

# Démarrage des conteneurs Docker avec docker-compose
sudo docker-compose up -d

# Affichage des conteneurs Docker en cours d'exécution
sudo docker ps


# Commande pour obtenir l'adresse IP de la machine virtuelle et la ressortir en gras à la fin
ip_address=$(hostname -I)

# Vérification si une adresse IP est disponible
if [ -n "$ip_address" ]; then
    echo -e "\e[1;91mDolibar accessible depuis l'adresse: $ip_address\e[0m"
else
    echo "Aucune adresse IP trouvée."
    exit 1
fi



