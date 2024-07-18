#!/bin/bash

# Couleurs pour une meilleure lisibilité
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Démarrage de l'environnement Kubernetes local...${NC}"

# Fonction pour vérifier si une commande s'est bien exécutée
check_command() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1${NC}"
    else
        echo -e "\033[0;31m✗ $1 a échoué. Arrêt du script.${NC}"
        exit 1
    fi
}

# Démarrage de Minikube
echo "Démarrage de Minikube..."
minikube start --driver=docker --cpus=2 --memory=4096
check_command "Démarrage de Minikube"

# Vérification du statut de Minikube
echo "Vérification du statut de Minikube..."
minikube status
check_command "Statut de Minikube"

# Configuration du contexte Kubernetes
echo "Configuration du contexte Kubernetes..."
kubectl config use-context minikube
check_command "Configuration du contexte"

# Activation de l'addon Ingress
echo "Activation de l'addon Ingress..."
minikube addons enable ingress
check_command "Activation de l'addon Ingress"

# Récupération de l'IP de Minikube
echo "Récupération de l'IP de Minikube..."
MINIKUBE_IP=$(minikube ip)
echo "IP de Minikube: $MINIKUBE_IP"
check_command "Récupération de l'IP"

# Vérification des services Ingress
echo "Vérification des services Ingress..."
kubectl get services ingress-nginx-controller -n ingress-nginx
check_command "Vérification des services Ingress"

echo -e "${GREEN}L'environnement Kubernetes local est prêt !${NC}"
echo -e "Utilisez l'IP ${YELLOW}$MINIKUBE_IP${NC} pour accéder à vos services via Ingress."