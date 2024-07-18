#!/bin/bash

echo "Vérification des versions des outils installés:"

echo -n "Docker: "
docker --version 2>/dev/null || echo "Non installé"

echo -n "kubectl: "
kubectl version --client 2>/dev/null || echo "Non installé"

echo -n "Minikube: "
minikube version 2>/dev/null || echo "Non installé"

echo -n "Helm: "
helm version --short 2>/dev/null || echo "Non installé"

echo -n "Kustomize: "
kustomize version 2>/dev/null || echo "Non installé"

echo -n "Git: "
git --version 2>/dev/null || echo "Non installé"
