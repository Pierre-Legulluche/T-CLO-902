# Résumé pédagogique : Notre infrastructure Kubernetes locale

## Vue d'ensemble

Nous avons mis en place une infrastructure Kubernetes locale pour le développement et les tests. Voici un résumé des outils principaux et leur rôle dans notre système.

## 1. Cluster Kubernetes

### Pourquoi un cluster Kubernetes ?

Imaginez Kubernetes comme un chef d'orchestre talentueux. Dans un orchestre, chaque musicien (conteneur) joue son instrument (exécute son application), mais c'est le chef d'orchestre qui s'assure que tout le monde joue en harmonie, au bon moment et avec la bonne intensité.

Kubernetes fait de même pour nos applications :
- Il s'assure que le bon nombre d'instances de chaque application est en cours d'exécution.
- Il répartit la charge de travail entre les différentes machines.
- Il redémarre automatiquement les applications qui échouent.
- Il met à jour les applications sans temps d'arrêt.

**Exemple de cycle de vie :** 
Imaginons que vous ayez une application de e-commerce. Pendant les soldes, le trafic augmente soudainement. Kubernetes peut automatiquement augmenter le nombre d'instances de votre application pour gérer la charge, puis les réduire une fois les soldes terminées, tout cela sans intervention manuelle.

## 2. Minikube

### Pourquoi Minikube ?

Minikube est comme un mini-terrain de jeu Kubernetes. Si Kubernetes est un immense parc d'attractions, Minikube est une version miniature que vous pouvez installer dans votre jardin.

Nous utilisons Minikube car :
- Il permet de simuler un cluster Kubernetes complet sur une seule machine.
- C'est idéal pour l'apprentissage et le développement local.
- Il est léger et facile à installer/désinstaller.

**Métaphore :** 
Pensez à Minikube comme à un simulateur de vol pour pilotes. Avant de piloter un vrai avion (cluster Kubernetes en production), les pilotes (développeurs) s'entraînent sur un simulateur (Minikube) qui reproduit fidèlement l'environnement réel sans les risques associés.

## 3. Ingress

### Qu'est-ce qu'un Ingress ?

Un Ingress est comme le réceptionniste d'un grand hôtel. Quand les clients (requêtes) arrivent, le réceptionniste (Ingress) les dirige vers les bonnes chambres (services) en fonction de leurs réservations (règles de routage).

L'Ingress :
- Gère le trafic entrant vers le cluster.
- Route les requêtes vers les bons services en fonction des règles définies.
- Peut gérer le SSL/TLS pour sécuriser les connexions.

### Comment faire un Ingress sécurisé ?

Pour sécuriser un Ingress, c'est comme ajouter des mesures de sécurité à notre hôtel :

1. **Utiliser HTTPS :** C'est comme donner des cartes-clés sécurisées aux clients au lieu de clés standard.
   ```yaml
   annotations:
     kubernetes.io/ingress.class: nginx
     cert-manager.io/cluster-issuer: "letsencrypt-prod"
   ```

2. **Authentification :** Comme demander une pièce d'identité à la réception.
   ```yaml
   annotations:
     nginx.ingress.kubernetes.io/auth-type: basic
     nginx.ingress.kubernetes.io/auth-secret: basic-auth
   ```

3. **Rate Limiting :** Limiter le nombre de requêtes, comme limiter le nombre de fois qu'un client peut appeler la réception.
   ```yaml
   annotations:
     nginx.ingress.kubernetes.io/limit-rps: "10"
   ```

**Exemple de cycle de vie d'une requête sécurisée :**
1. Un utilisateur accède à votre site web.
2. L'Ingress reçoit la requête HTTPS.
3. Il vérifie le certificat SSL.
4. Il authentifie l'utilisateur si nécessaire.
5. Il vérifie les limites de taux de requêtes.
6. S'il passe toutes ces étapes, l'Ingress route la requête vers le service approprié dans le cluster.

## Conclusion

Cette infrastructure nous fournit un environnement de développement local qui imite étroitement un environnement de production Kubernetes. Cela nous permet de développer, tester et déboguer nos applications dans un contexte réaliste, tout en restant dans un environnement contrôlé et sécurisé.