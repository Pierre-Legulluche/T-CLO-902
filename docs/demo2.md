# Démo Kubernetes : Déploiement d'une application avec monitoring

Bonjour à tous ! Je vais vous présenter les étapes que j'ai suivies pour déployer une application sur un cluster Kubernetes local avec Minikube, en mettant en place une stack de monitoring complète.

## Prérequis

Avant de commencer, je m'assure que tous les outils nécessaires sont installés sur ma machine :

- Docker
- kubectl
- Minikube
- Helm
- Kustomize

Je vérifie les versions des outils en exécutant le script `is_tool_version.sh` se trouvant dans le répertoire `scripts/` du projet.

## Démarrage du cluster Kubernetes

Pour démarrer un cluster Kubernetes local avec Minikube, j'exécute le script `start_cluster_dev.sh` également présent dans le répertoire `scripts/`. Ce script réalise les actions suivantes :

1. Démarrage de Minikube avec la commande `minikube start --driver=docker --cpus=2 --memory=4096`
2. Vérification du statut de Minikube avec `minikube status`
3. Configuration du contexte Kubernetes pour utiliser le cluster Minikube avec `kubectl config use-context minikube`
4. Activation de l'addon Ingress avec `minikube addons enable ingress`
5. Récupération de l'adresse IP de Minikube avec `minikube ip`
6. Vérification des services Ingress avec `kubectl get services ingress-nginx-controller -n ingress-nginx`

Une fois le script exécuté, le cluster Kubernetes local est prêt à être utilisé.

## Déploiement de l'application

L'application que je vais déployer est une application React simple. Les fichiers nécessaires au déploiement se trouvent dans le répertoire `applications/kubernetes-test-app/`.

Je commence par supprimer les anciens déploiements et services qui ne sont plus nécessaires :

```bash
kubectl delete deployment react-app
kubectl delete deployment kubernetes-react-app
kubectl delete service kubernetes-react-app-service
```

Ensuite, je déploie l'application en utilisant Kustomize :

```bash
kubectl apply -k applications/kubernetes-test-app
```

Cette commande applique les configurations Kustomize définies dans le fichier `kustomization.yaml`. Ce fichier référence les fichiers de ressources suivants :

- `deployment.yaml` : Définit le déploiement de l'application avec 3 réplicas, les ressources requises et les annotations Prometheus pour le scraping des métriques.
- `service.yaml` : Définit le service pour exposer l'application à l'intérieur du cluster sur le port 80.
- `ingress.yaml` : Définit l'ingress pour exposer l'application à l'extérieur du cluster sur le port 80 avec l'hôte `react-app.local`.

Je vérifie que les pods de l'application sont bien en cours d'exécution avec `kubectl get pods`.

## Configuration du monitoring

Pour mettre en place la stack de monitoring, j'utilise Prometheus et Grafana. Les fichiers de configuration se trouvent dans le répertoire `monitoring/kube-prometheus/`.

Prometheus est configuré pour scraper les métriques de l'application grâce aux annotations définies dans le fichier `deployment.yaml`. Le fichier `prometheus-prometheus.yaml` définit la configuration de Prometheus, notamment les labels, les sélecteurs et les règles d'alerte.

Grafana est déployé à l'aide du fichier `grafana-deployment.yaml` qui spécifie l'image Docker à utiliser, les volumes à monter pour les dashboards et les datasources, ainsi que les ressources requises.

Les fichiers `prometheus-service.yaml` et `grafana-service.yaml` définissent les services pour exposer Prometheus et Grafana à l'intérieur du cluster.

Pour accéder à Grafana depuis l'extérieur du cluster, j'utilise la commande suivante pour faire un port-forward :

```bash
kubectl port-forward -n monitoring service/grafana 3000:3000
```

Cela me permet d'accéder à l'interface de Grafana à l'adresse `http://localhost:3000` dans mon navigateur.

Une fois connecté à Grafana, je peux importer les dashboards prédéfinis pour visualiser les métriques du cluster Kubernetes et de mon application. Les dashboards sont configurés dans le fichier `grafana-dashboardDefinitions.yaml`.

## Conclusion

Voilà ! Nous avons vu comment déployer une application sur un cluster Kubernetes local avec Minikube, en mettant en place une stack de monitoring complète avec Prometheus et Grafana.

Les points clés à retenir sont :

- L'utilisation de scripts pour automatiser le démarrage du cluster et la vérification des outils nécessaires.
- La définition des ressources Kubernetes (déploiement, service, ingress) dans des fichiers YAML.
- L'utilisation de Kustomize pour gérer et déployer les manifestes Kubernetes.
- La configuration de Prometheus pour scraper les métriques de l'application.
- Le déploiement de Grafana pour visualiser les métriques collectées par Prometheus.
