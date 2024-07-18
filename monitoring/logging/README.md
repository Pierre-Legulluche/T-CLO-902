# Logging Stack avec Loki

Ce dossier contient la configuration pour notre stack de logging basée sur Loki.

## Installation

Loki a été installé en utilisant Helm avec des valeurs personnalisées. Pour réinstaller ou mettre à jour :

```bash
helm upgrade --install loki grafana/loki-stack -f loki-values.yaml --namespace monitoring
```

## Accès aux logs
Les logs peuvent être visualisés dans Grafana. Assurez-vous d'avoir ajouté la source de données Loki dans Grafana.
## Configuration
La configuration personnalisée de Loki se trouve dans le fichier loki-values.yaml.
