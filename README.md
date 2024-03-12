# SAE51
Le scriptinstalldocker.sh qui permet l'installation des prérecquis:

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl status docker
sudo apt install docker-compose


Le script install.sh
aide: https://hub.docker.com/r/tuxgasy/dolibarr
Execute:
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
# Message pour les identifiants de base en gras
echo -e "\e[1mLes identifiants de base sont \e[91madmin:admin\e[0m"

Par défaut, l'identifiant de dolibarr est admin:admin


