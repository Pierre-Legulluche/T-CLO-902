# Projet GitOps Kubernetes

Ce dépôt contient la configuration GitOps pour notre projet Kubernetes.

## Structure du projet

- `environments/`: Configurations spécifiques aux environnements
- `base/`: Manifestes Kubernetes de base
- `docs/`: Documentation détaillée
- `scripts/`: Scripts utilitaires

## Démarrage rapide

1. Clonez ce dépôt
2. Installez les prérequis (kubectl, kustomize, etc.)
3. Appliquez les configurations avec `kubectl apply -k environments/staging`

Pour plus d'informations, consultez la [documentation de configuration](docs/setup.md).