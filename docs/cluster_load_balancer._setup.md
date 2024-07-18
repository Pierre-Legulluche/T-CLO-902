# Récapitulatif : Mise en place d'un cluster Kubernetes local avec Ingress

## Étapes réalisées

1. Création d'un cluster Kubernetes local avec Minikube
2. Configuration du load balancer interne (NGINX Ingress Controller)

## Lexique

- **Kubernetes** : Système open-source pour l'automatisation du déploiement, de la mise à l'échelle et de la gestion des applications conteneurisées.
- **Minikube** : Outil qui permet de faire fonctionner un cluster Kubernetes à un seul nœud sur une machine locale.
- **Ingress** : Objet API Kubernetes qui gère l'accès externe aux services dans un cluster, généralement via HTTP.
- **NGINX Ingress Controller** : Implémentation d'un contrôleur Ingress utilisant NGINX comme reverse proxy et load balancer.
- **Helm** : Gestionnaire de paquets pour Kubernetes, utilisé pour installer et gérer des applications Kubernetes.
- **Load Balancer** : Composant qui distribue le trafic réseau entre plusieurs serveurs pour optimiser l'utilisation des ressources et améliorer la disponibilité.
- **NGINX** : Serveur web open-source utilisé aussi comme reverse proxy, load balancer, et cache HTTP.
- **Reverse Proxy** : Serveur intermédiaire qui récupère des ressources pour le compte d'un client auprès d'un ou plusieurs serveurs.

## Services mis en place

### 1. Cluster Kubernetes (Minikube)

- **Objectif** : Fournir un environnement Kubernetes local pour le développement et les tests.
- **Utilité** : Permet de simuler un cluster Kubernetes complet sur une seule machine, idéal pour le développement et l'apprentissage.

### 2. NGINX Ingress Controller

- **Objectif** : Gérer les entrées HTTP et HTTPS vers le cluster Kubernetes.
- **Utilité** : 
  - Agit comme un point d'entrée unique pour le trafic externe.
  - Permet de router le trafic vers différents services basés sur les règles définies.
  - Offre des fonctionnalités comme l'équilibrage de charge, le SSL/TLS, et le routage basé sur le nom d'hôte.

## Commandes clés utilisées

- `minikube start` : Démarre un cluster Kubernetes local.
- `minikube stop`: Arrête le cluster Kubernetes local.
- `minikube delete` : Supprime le cluster Kubernetes local.
- `minikube status` : Affiche l'état du cluster Minikube.
- `helm install` : Installe des packages Kubernetes (charts) via Helm.
- `kubectl get pods --all-namespaces` : Affiche tous les pods dans tous les namespaces.
- `kubectl get services --all-namespaces` : Affiche tous les services dans tous les namespaces.
- `kubectl delete pod <nom-du-pod>` : Supprime un pod spécifique.
- `kubectl delete --all pods --namespace=default` : Supprime tous les pods dans le namespace par défaut.
- `minikube addons enable ingress` : Active l'addon Ingress dans Minikube.
- `kubectl get ingress --all-namespaces` : Affiche toutes les ressources Ingress.

## Procédure de démarrage/redémarrage du cluster

Démarrer Minikube :


## Prochaines étapes

- Installation du dashboard Kubernetes
- Mise en place de la stack de monitoring
- Configuration de la stack de logging
- Création d'un dépôt GitOps pour les manifestes

**# Récapitulatif : Mise en place et gestion d'un cluster Kubernetes local avec Ingress**

**## Étapes réalisées**
1. Création d'un cluster Kubernetes local avec Minikube
2. Configuration du load balancer interne (NGINX Ingress Controller)

**## Lexique**
- **Kubernetes** : Système open-source pour l'automatisation du déploiement, de la mise à l'échelle et de la gestion des applications conteneurisées.
- **Minikube** : Outil qui permet de faire fonctionner un cluster Kubernetes à un seul nœud sur une machine locale.
- **Ingress** : Objet API Kubernetes qui gère l'accès externe aux services dans un cluster, généralement via HTTP.
- **NGINX Ingress Controller** : Implémentation d'un contrôleur Ingress utilisant NGINX comme reverse proxy et load balancer.
- **Helm** : Gestionnaire de paquets pour Kubernetes, utilisé pour installer et gérer des applications Kubernetes.
- **Load Balancer** : Composant qui distribue le trafic réseau entre plusieurs serveurs pour optimiser l'utilisation des ressources et améliorer la disponibilité.
- **NGINX** : Serveur web open-source utilisé aussi comme reverse proxy, load balancer, et cache HTTP.
- **Reverse Proxy** : Serveur intermédiaire qui récupère des ressources pour le compte d'un client auprès d'un ou plusieurs serveurs.

**## Services mis en place**
**### 1. Cluster Kubernetes (Minikube)**
- **Objectif** : Fournir un environnement Kubernetes local pour le développement et les tests.
- **Utilité** : Permet de simuler un cluster Kubernetes complet sur une seule machine, idéal pour le développement et l'apprentissage.

**### 2. NGINX Ingress Controller**
- **Objectif** : Gérer les entrées HTTP et HTTPS vers le cluster Kubernetes.
- **Utilité** :
  - Agit comme un point d'entrée unique pour le trafic externe.
  - Permet de router le trafic vers différents services basés sur les règles définies.
  - Offre des fonctionnalités comme l'équilibrage de charge, le SSL/TLS, et le routage basé sur le nom d'hôte.

**## Commandes clés utilisées**
- `minikube start` : Démarre un cluster Kubernetes local.
- `minikube stop` : Arrête le cluster Kubernetes local.
- `minikube delete` : Supprime le cluster Kubernetes local.
- `minikube status` : Affiche l'état du cluster Minikube.
- `helm install` : Installe des packages Kubernetes (charts) via Helm.
- `kubectl get pods --all-namespaces` : Affiche tous les pods dans tous les namespaces.
- `kubectl get services --all-namespaces` : Affiche tous les services dans tous les namespaces.
- `kubectl delete pod <nom-du-pod>` : Supprime un pod spécifique.
- `kubectl delete --all pods --namespace=default` : Supprime tous les pods dans le namespace par défaut.
- `minikube addons enable ingress` : Active l'addon Ingress dans Minikube.
- `kubectl get ingress --all-namespaces` : Affiche toutes les ressources Ingress.


## Procédure de démarrage/redémarrage du cluster

1. Démarrer Minikube :
   ```
   minikube start
   ```

2. Vérifier l'état du cluster :
   ```
   minikube status
   kubectl get nodes
   ```

3. Activer l'addon Ingress si nécessaire :
   ```
   minikube addons enable ingress
   ```

4. Vérifier que l'Ingress Controller est en cours d'exécution :
   ```
   kubectl get pods -n ingress-nginx
   ```

5. Redéployer les applications si nécessaire :
   ```
   kubectl apply -f <fichier-de-deploiement.yaml>
   ```

6. Vérifier que tous les services sont opérationnels :
   ```
   kubectl get pods --all-namespaces
   kubectl get services --all-namespaces
   ```

## Prochaines étapes

- Installation du dashboard Kubernetes
- Mise en place de la stack de monitoring
- Configuration de la stack de logging
- Création d'un dépôt GitOps pour les manifestes

## Dépannage courant

- Si des pods sont bloqués en état "Terminating" : 
  ```
  kubectl delete pod <nom-du-pod> --grace-period=0 --force
  ```

- Pour redémarrer un déploiement : 
  ```
  kubectl rollout restart deployment <nom-du-deploiement>
  ```

- Pour vérifier les logs d'un pod : 
  ```
  kubectl logs <nom-du-pod>
  ```

- Pour entrer dans un pod en mode interactif : 
  ```
  kubectl exec -it <nom-du-pod> -- /bin/bash
  ```

**## Prochaines étapes**
- Installation du dashboard Kubernetes
- Mise en place de la stack de monitoring
- Configuration de la stack de logging
- Création d'un dépôt GitOps pour les manifestes

**## Dépannage courant**
- Si des pods sont bloqués en état "Terminating" : `kubectl delete pod <nom-du-pod> --grace-period=0 --force`
- Pour redémarrer un déploiement : `kubectl rollout restart deployment <nom-du-deploiement>`
- Pour vérifier les logs d'un pod : `kubectl logs <nom-du-pod>`
- Pour entrer dans un pod en mode interactif : `kubectl exec -it <nom-du-pod> -- /bin/bash`

Ce guide couvre maintenant les étapes de démarrage et de redémarrage du cluster, ainsi que des commandes supplémentaires pour vérifier l'état des services et gérer les pods. Le lexique a été enrichi avec les définitions demandées.