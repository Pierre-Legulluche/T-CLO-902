# Fiche de démonstration du projet Kubernetes

## 1. Introduction

Ce projet démontre la mise en place d'une infrastructure Kubernetes complète, incluant le déploiement d'une application, la gestion du trafic, le monitoring et le logging.

## 2. Structure du projet

Notre projet est organisé de manière modulaire, avec des dossiers distincts pour chaque composant :

- `applications` : Contient les manifestes Kubernetes pour notre application React.
- `monitoring` : Contient la configuration pour Prometheus et Grafana.
- `logging` : Contient la configuration pour Loki.
- `gitops` : Démontre l'approche GitOps pour la gestion des déploiements.
- `scripts` : Contient des scripts utilitaires pour la gestion du cluster.

## 3. Démarrage du cluster

Commencez par exécuter le script `start_cluster_dev.sh` :

```bash
./scripts/start_cluster_dev.sh
```

Ce script :
- Démarre Minikube
- Configure le contexte Kubernetes
- Active l'addon Ingress
- Affiche l'IP de Minikube pour accéder aux services

Justification : Ce script automatise le processus de démarrage, assurant une configuration cohérente à chaque exécution.

## 4. Vérification des outils installés

Exécutez le script `is_tool_version.sh` :

```bash
./scripts/is_tool_version.sh
```

Ce script vérifie la présence et les versions des outils nécessaires (Docker, kubectl, Minikube, Helm, Kustomize, Git).

Justification : Assure que tous les outils requis sont correctement installés avant de procéder.

## 5. Déploiement de l'application

Déployez l'application React :

```bash
kubectl apply -k applications/kubernetes-test-app/
```

Vérifiez le déploiement :

```bash
kubectl get pods
kubectl get services
kubectl get ingress
```

Accédez à l'application via `http://react-app.local` (assurez-vous que l'entrée DNS est configurée dans `/etc/hosts`).

```bash
cat /etc/hosts
127.0.0.1       localhost
127.0.1.1       debian
192.168.49.2    react-app.local

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

Justification : Démontre le déploiement d'une application réelle dans Kubernetes et l'utilisation de Kustomize pour la gestion des configurations.

## 6. Monitoring avec Prometheus et Grafana

Accédez à Grafana :

```bash
kubectl port-forward svc/grafana 3000:3000 -n monitoring
```

Visitez `http://localhost:3000` et connectez-vous (utilisateur: admin, mot de passe: admin par défaut).

Démonstration :
- Montrez les dashboards prédéfinis
- Créez un nouveau dashboard pour surveiller l'application React

Justification : Illustre la capacité de surveiller en temps réel les performances et la santé de l'application et du cluster.

## 7. Logging avec Loki

Dans Grafana, ajoutez Loki comme source de données et créez un dashboard pour visualiser les logs.

Démonstration :
- Affichez les logs de l'application React
- Montrez comment filtrer les logs

Justification : Montre la centralisation des logs, cruciale pour le débogage et l'analyse des problèmes.

## 8. Démonstration de scalabilité

Scalez l'application :

```bash
kubectl scale deployment react-app --replicas=5
```

Observez les changements dans Grafana.

Justification : Démontre la facilité de mise à l'échelle des applications dans Kubernetes.

## 9. Simulation d'un échec

Supprimez manuellement un pod :

```bash
kubectl delete pod <nom-du-pod-react-app>
```

Observez dans Grafana :
- La baisse momentanée du nombre de pods
- Le redémarrage automatique du pod par Kubernetes

Justification : Illustre la résilience et l'auto-guérison de Kubernetes.

## 10. GitOps avec Kustomize

Montrez la structure du dossier `gitops` :
- Expliquez la différence entre `base` et `overlays`
- Montrez comment appliquer une configuration pour l'environnement de développement :

```bash
kubectl apply -k gitops/overlays/dev
```

Justification : Démontre une approche déclarative et versionnable pour la gestion des configurations Kubernetes.

## Conclusion

Cette démonstration illustre une infrastructure Kubernetes complète, de la mise en place du cluster au déploiement d'applications, en passant par le monitoring, le logging et la gestion des configurations. Elle met en évidence les principales caractéristiques de Kubernetes : scalabilité, résilience, observabilité et gestion déclarative des configurations.

---

Cette fiche vous guidera à travers une démonstration complète de votre projet, mettant en valeur les différents composants et fonctionnalités que vous avez mis en place. N'hésitez pas à adapter ou à approfondir certaines parties en fonction de votre audience et du temps dont vous disposez pour la démonstration.