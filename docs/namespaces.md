# Les namespaces dans Kubernetes

## Utilité
- Diviser logiquement un cluster Kubernetes en plusieurs environnements virtuels
- Isoler les ressources (pods, services, deployments, etc.) en groupes distincts
- Organiser et gérer les différentes parties d'un cluster (environnements, équipes, projets)
- Contrôler l'accès et la sécurité avec des politiques de contrôle d'accès (RBAC) au niveau du namespace
- Allouer et limiter les ressources consommées par un namespace

## Application dans notre projet
- Créer des namespaces séparés pour les différents environnements (dev, test, prod)
- Isoler les ressources de l'application principale des ressources de monitoring (Prometheus, Grafana)
- Définir des politiques de contrôle d'accès pour limiter l'accès aux ressources sensibles
- Mettre en place des quotas de ressources pour éviter qu'un environnement ne consomme toutes les ressources du cluster

## Commandes utiles
- Créer un namespace :
  ```
  kubectl create namespace <nom-du-namespace>
  ```
- Lister les namespaces :
  ```
  kubectl get namespaces
  ```
- Créer une ressource dans un namespace spécifique :
  ```
  kubectl apply -f <fichier-yaml> --namespace <nom-du-namespace>
  ```
- Lister les ressources dans un namespace spécifique :
  ```
  kubectl get <type-de-ressource> --namespace <nom-du-namespace>
  ```
- Supprimer un namespace et toutes ses ressources :
  ```
  kubectl delete namespace <nom-du-namespace>
  ```

## Bonnes pratiques
- Utiliser des namespaces significatifs et descriptifs pour organiser les ressources
- Ne pas utiliser le namespace `default` pour toutes les ressources, mais créer des namespaces spécifiques
- Définir des politiques de contrôle d'accès (RBAC) au niveau des namespaces pour une sécurité granulaire
- Utiliser des quotas de ressources et des limites pour contrôler l'utilisation des ressources par namespace
- Préfixer les noms de ressources avec le nom du namespace pour éviter les conflits de noms
- Documenter l'utilisation et la convention de nommage des namespaces dans le projet

En utilisant judicieusement les namespaces dans notre projet Kubernetes, nous pouvons :
- Organiser et isoler les différentes parties de notre application et de notre infrastructure
- Gérer les accès et la sécurité de manière granulaire
- Contrôler l'allocation et la consommation des ressources par environnement
- Faciliter la gestion et la maintenance de notre cluster Kubernetes