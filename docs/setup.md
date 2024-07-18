# Guide de redémarrage et d'utilisation du cluster Kubernetes local



## Redémarrage du cluster et des services

1. Démarrer le cluster Minikube :
   ```bash
   minikube start --driver=docker --cpus=2 --memory=4096
   ```
   Cette commande initialise un cluster Kubernetes local avec 2 CPUs et 4Go de RAM.

2. Vérifier l'état du cluster :

   ```bash
   minikube status
   ```
   Affiche l'état actuel du cluster Minikube.

3. Configurer kubectl pour utiliser le cluster Minikube :
   ```bash
   kubectl config use-context minikube
   ```
   Assure que kubectl communique avec le bon cluster.

4. Réinstaller NGINX Ingress Controller :
   ```bash
   helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
   helm repo update
   helm install ingress-nginx ingress-nginx/ingress-nginx
   ```
   Ces commandes ajoutent le repo Helm de NGINX Ingress, le mettent à jour, puis installent le contrôleur.

5. Activer l'addon Ingress de Minikube :
   ```bash
   minikube addons enable ingress
   ```
   Active le support natif de l'Ingress dans Minikube.

6. Obtenir l'adresse IP du cluster Minikube :
   ```bash
   minikube ip
   ```
   Affiche l'adresse IP à utiliser pour accéder aux services via Ingress.

7. Vérifier que le service Ingress est prêt :
   ```bash
   kubectl get services ingress-nginx-controller
   ```
   Montre l'état du service Ingress Controller.

8. Redémarrer le dashboard Kubernetes (si nécessaire) :
   ```bash
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
   ```
   Réinstalle le dashboard Kubernetes s'il n'est plus présent.

## Commandes utiles et leur utilisation

1. Lister tous les pods :
   ```bash
   kubectl get pods --all-namespaces
   ```
   Affiche tous les pods dans tous les namespaces, utile pour vérifier l'état global du cluster.

2. Décrire un pod spécifique :
   ```bash
   kubectl describe pod <nom-du-pod> -n <namespace>
   ```
   Fournit des informations détaillées sur un pod spécifique, y compris les événements récents.

3. Afficher les logs d'un pod :
   ```bash
   kubectl logs <nom-du-pod> -n <namespace>
   ```
   Montre les logs d'un pod, utile pour le débogage.

4. Lister tous les services :
   ```bash
   kubectl get services --all-namespaces
   ```
   Affiche tous les services dans le cluster, y compris leurs types et IP clusters.

5. Accéder à un shell dans un pod :
   ```bash
   kubectl exec -it <nom-du-pod> -n <namespace> -- /bin/bash
   ```
   Ouvre un shell interactif dans un pod, utile pour le débogage ou l'exécution de commandes à l'intérieur du conteneur.

6. Appliquer un fichier de configuration :
   ```bash
   kubectl apply -f <nom-du-fichier.yaml>
   ```
   Crée ou met à jour des ressources définies dans un fichier YAML.

7. Supprimer une ressource :
   ```bash
   kubectl delete <type-de-ressource> <nom-de-la-ressource>
   ```
   Supprime une ressource spécifique (pod, service, deployment, etc.) du cluster.

8. Afficher les informations du cluster :
   ```bash
   kubectl cluster-info
   ```
   Montre l'adresse du master et des services de base du cluster.

9. Lister les nodes du cluster :
   ```bash
   kubectl get nodes
   ```
   Affiche tous les nœuds du cluster et leur statut.

10. Afficher la consommation des ressources des pods :
    ```bash
    kubectl top pods
    ```
    Montre l'utilisation CPU et mémoire des pods (nécessite metrics-server).

11. Démarrer le proxy pour accéder au dashboard :
    ```bash
    kubectl proxy
    ```
    Démarre un proxy pour accéder au dashboard Kubernetes via http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

12. Obtenir un token pour se connecter au dashboard :
    ```bash
    kubectl -n kubernetes-dashboard create token admin-user
    ```
    Génère un token d'accès pour le dashboard Kubernetes.

```
