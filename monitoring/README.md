# Stack de Monitoring Kubernetes

Ce dossier contient les configurations pour notre stack de monitoring basée sur kube-prometheus.

## Installation

Pour installer la stack de monitoring, suivez ces étapes :

1. Appliquez les manifestes de configuration :

```bash
kubectl apply --server-side -f manifests/setup
kubectl wait 
--for condition=Established 
--all CustomResourceDefinition 
--namespace=monitoring
kubectl apply -f manifests/
```

2. Vérifiez que tous les pods sont en cours d'exécution :

```bash
kubectl get pods -n monitoring

```

## Accès aux interfaces

Pour accéder aux interfaces de Prometheus, Alertmanager et Grafana, utilisez le port-forwarding :

- Grafana :

```bash
kubectl port-forward -n monitoring svc/grafana 3000:3000
```

Accédez à Grafana sur http://localhost:3000 (utilisateur: admin, mot de passe: admin)

- Prometheus :

```bash
kubectl port-forward -n monitoring svc/prometheus-k8s 9090:9090
```

Accédez à Prometheus sur http://localhost:9090

- Alertmanager :

```bash
kubectl port-forward -n monitoring svc/alertmanager-main 9093:9093
```

Accédez à Alertmanager sur http://localhost:9093