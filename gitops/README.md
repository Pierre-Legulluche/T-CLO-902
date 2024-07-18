# GitOps Configuration

Ce dépôt contient les configurations Kubernetes gérées via GitOps.

## Structure

- `base/`: Contient les configurations de base
- `overlays/`: Contient les personnalisations spécifiques à chaque environnement
  - `dev/`: Configurations pour l'environnement de développement
  - `prod/`: Configurations pour l'environnement de production

## Utilisation

Pour appliquer les configurations :

Environnement de développement :

```bash
kubectl apply -k overlays/dev
```

Environnement de production :

```bash
kubectl apply -k overlays/prod
```