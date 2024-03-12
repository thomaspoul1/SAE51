
# SAE51

# Le script installdocker.sh

Permet l'installation des paquets Docker et Docker Compose automatiquement nécessaires au projet.

### Met à jour la liste des paquets disponibles dans les référentiels APT.

sudo apt-get update

### Installe les paquets requis pour ajouter des référentiels HTTPS et installer les clés de chiffrement GPG.

sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

### Télécharge la clé GPG de Docker, la décode, puis l'enregistre dans /usr/share/keyrings/docker-archive-keyring.gpg.

sudo curl -fsSL [https://download.docker.com/linux/debian/gpg](https://download.docker.com/linux/debian/gpg) | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

### Ajoute le référentiel Docker au fichier sources.list.d/docker.list

sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] [https://download.docker.com/linux/debian](https://download.docker.com/linux/debian) $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

### Mise à jour des paquets

sudo apt-get update

### Installation de Docker

sudo apt-get install docker-ce docker-ce-cli containerd.io

### Activation du service Docker

sudo systemctl enable docker

### Vérification de l'état du service Docker

sudo systemctl status docker

### Installation de Docker Compose

sudo apt install docker-compose

# Le script install.sh

### Installation de Docker

Lance le script détaillé précédemment sudo ./installdocker.sh

### Démarrage des conteneurs Docker avec docker-compose

sudo docker-compose up -d

### Affichage des conteneurs Docker en cours d'exécution

sudo docker ps

### Commande pour obtenir l'adresse IP de la machine virtuelle et la ressortir en gras à la fin

ip_address=$(hostname -I)

### Vérification si une adresse IP est disponible

if [ -n "$ip_address" ]; then echo -e "\e[1;91mDolibarr accessible depuis l'adresse: $ip_address\e[0m" else echo "Aucune adresse IP trouvée." exit 1 fi

### Message pour les identifiants de base en gras

echo -e "\e[1mLes identifiants de base sont \e[91madmin:admin\e[0m"

### Identifiant par défaut

Par défaut, l'identifiant de Dolibarr est admin:admin

