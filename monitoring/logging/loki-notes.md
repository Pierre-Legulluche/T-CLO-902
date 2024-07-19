# Notes sur la stack de Logging avec Loki

## Introduction

Imaginez que vous gérez un grand centre commercial. Chaque magasin, chaque ascenseur, chaque caméra de sécurité génère des informations constamment. Sans un système centralisé pour collecter et analyser ces informations, il serait impossible de comprendre ce qui se passe dans l'ensemble du centre commercial à un moment donné. C'est exactement le rôle que joue une stack de logging dans un environnement Kubernetes.

## Les outils de notre stack de logging

1. **Loki** : C'est notre "centre de contrôle". Comme le bureau de sécurité central d'un centre commercial, Loki reçoit, stocke et indexe tous les logs.

2. **Promtail** : Pensez à Promtail comme aux agents de sécurité dispersés dans le centre commercial. Ils collectent les informations (logs) de chaque magasin (pod) et les envoient au bureau central (Loki).

3. **Grafana** : C'est notre "salle de surveillance". Grafana nous permet de visualiser et d'analyser les logs stockés dans Loki, comme les écrans de surveillance dans le bureau de sécurité.

## À quoi servent concrètement ces outils ?

- **Collecte de logs** : Promtail collecte automatiquement les logs de tous vos pods Kubernetes.
- **Stockage efficient** : Loki stocke ces logs de manière compressée et indexée pour une recherche rapide.
- **Analyse en temps réel** : Vous pouvez rechercher et analyser les logs en temps réel via Grafana.
- **Alerting** : Configurez des alertes basées sur des patterns spécifiques dans vos logs.

## Comment s'utilisent-ils ?

1. **Collecte** : Promtail s'exécute automatiquement sur chaque nœud de votre cluster.
2. **Stockage** : Loki reçoit et stocke les logs envoyés par Promtail.
3. **Visualisation** : Dans Grafana, ajoutez Loki comme source de données.
4. **Requêtes** : Utilisez le langage LogQL dans Grafana pour interroger vos logs.

Exemple de requête simple :
```
{app="myapp"} |= "error"
```
Cette requête recherche tous les logs de l'application "myapp" contenant le mot "error".

## Commandes essentielles en environnement de production

1. Vérifier l'état des pods Loki :
   ```
   kubectl get pods -n monitoring | grep loki
   ```

2. Consulter les logs de Loki :
   ```
   kubectl logs -f deployment/loki -n monitoring
   ```

3. Redémarrer Promtail si nécessaire :
   ```
   kubectl rollout restart daemonset/loki-promtail -n monitoring
   ```

4. Vérifier la configuration de Loki :
   ```
   kubectl get configmap -n monitoring loki -o yaml
   ```

## Problèmes courants et solutions

1. **Problème** : Loki ne reçoit pas de logs.
   **Solution** : Vérifiez que Promtail fonctionne correctement sur tous les nœuds.

2. **Problème** : Recherches lentes dans Grafana.
   **Solution** : Optimisez vos requêtes LogQL, ajustez les index de Loki.

3. **Problème** : Consommation élevée de ressources.
   **Solution** : Ajustez la rétention des logs, utilisez le "chunk caching".

## Cas d'utilisation pertinents

1. **Débogage d'applications** : Identifiez rapidement la source des erreurs.
2. **Analyse de sécurité** : Détectez les activités suspectes dans vos applications.
3. **Optimisation des performances** : Identifiez les goulots d'étranglement en analysant les logs de performance.
4. **Conformité** : Gardez une trace de toutes les actions pour des audits de conformité.

## Exemple concret

Imaginons une application de e-commerce en production. Un client signale qu'il ne peut pas finaliser son achat.

1. Vous utilisez Grafana pour rechercher les logs de l'application de paiement :
   ```
   {app="payment-service"} |= "transaction failed"
   ```
2. Vous trouvez rapidement que plusieurs transactions ont échoué à cause d'un timeout avec le service bancaire.
3. Vous pouvez maintenant investiguer le service bancaire et potentiellement augmenter le timeout pour résoudre le problème.

Sans une stack de logging centralisée, trouver cette information aurait pu prendre des heures, voire des jours.

## Conclusion

Une stack de logging bien configurée est comme avoir des yeux et des oreilles partout dans un système. Elle permet de comprendre ce qui se passe, de réagir rapidement aux problèmes et d'optimiser continuellement vos applications. C'est un outil indispensable pour toute équipe gérant des applications en production dans un environnement Kubernetes.
