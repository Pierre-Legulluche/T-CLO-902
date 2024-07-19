1. Surveillance de l'utilisation des ressources par les pods :
   - Accédez à Grafana et ouvrez le dashboard "Kubernetes / Compute Resources / Pod".
   - Ce dashboard montre l'utilisation du CPU et de la mémoire par les pods dans votre cluster.
   - Vous pouvez filtrer par namespace, deployment, pod, etc.
   - Pour voir comment l'utilisation des ressources change, vous pouvez augmenter la charge sur votre application en envoyant plus de requêtes.
   - Utilisez un outil comme Apache Bench ou Hey pour envoyer une charge de travail à votre application : 
     ```bash
     ab -n 1000 -c 100 http://votre-application.local/
     ```
   - Observez comment les graphiques d'utilisation du CPU et de la mémoire changent en temps réel dans Grafana.

2. Surveillance de l'état de santé des pods :
   - Accédez au dashboard "Kubernetes / Kubelet" dans Grafana.
   - Ce dashboard montre diverses métriques liées à l'état de santé des pods, comme le nombre de pods en cours d'exécution, les redémarrages de pods, etc.
   - Vous pouvez simuler un problème en supprimant un pod :
     ```bash
     kubectl delete pod nom-du-pod
     ```
   - Observez comment les graphiques dans Grafana reflètent le changement d'état du pod.

3. Surveillance de l'utilisation des ressources au niveau du nœud :
   - Accédez au dashboard "Nodes (Detailed)" dans Grafana.
   - Ce dashboard montre l'utilisation du CPU, de la mémoire, du disque et du réseau pour chaque nœud de votre cluster.
   - Vous pouvez stresser un nœud en lançant un pod gourmand en ressources sur ce nœud spécifique en utilisant des contraintes de nœuds (nodeSelector).
   - Observez comment les graphiques d'utilisation des ressources changent pour ce nœud dans Grafana.

4. Surveillance des métriques personnalisées de votre application :
   - Si votre application expose des métriques personnalisées, assurez-vous qu'elles sont scrapées par Prometheus.
   - Créez un dashboard personnalisé dans Grafana pour visualiser ces métriques.
   - Déclenchez des actions dans votre application qui affectent ces métriques personnalisées.
   - Observez comment les graphiques de votre dashboard personnalisé reflètent ces changements.

Pour voir les résultats de ces scénarios, vous pouvez :
- Utiliser Grafana : Accédez aux dashboards pertinents et observez les changements dans les graphiques en temps réel.
- Utiliser Prometheus : Exécutez des requêtes PromQL dans l'interface Web de Prometheus pour voir les valeurs des métriques.
- Utiliser kubectl : Utilisez des commandes comme `kubectl top pods` et `kubectl top nodes` pour voir l'utilisation des ressources en temps réel.

