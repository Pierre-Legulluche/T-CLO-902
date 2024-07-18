# les étapes pour installer et accéder au dashboard Kubernetes :

1. Installer le dashboard Kubernetes :
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
```

2. Créer un compte de service admin et un ClusterRoleBinding pour accéder au dashboard :
```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF
```

3. Obtenir le token pour se connecter au dashboard :
```bash
kubectl -n kubernetes-dashboard create token admin-user
```
Copiez ce token, vous en aurez besoin pour vous connecter au dashboard.

4. Démarrer le proxy Kubernetes pour accéder au dashboard :
```bash
kubectl proxy
```

5. Le dashboard est maintenant accessible à l'adresse suivante :
   http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

6. Utilisez le token obtenu à l'étape 3 pour vous connecter au dashboard.

7. Pour accéder au dashboard depuis votre navigateur local (si vous travaillez sur une machine distante), vous pouvez utiliser un tunnel SSH. Par exemple :
```bash
ssh -L 8001:127.0.0.1:8001 utilisateur@adresse_ip_machine_virtuelle
```

Ensuite, ouvrez votre navigateur local et accédez à l'URL mentionnée à l'étape 5.

Points importants à noter :

- Le dashboard Kubernetes est un outil puissant qui donne un accès complet à votre cluster. Assurez-vous de bien sécuriser son accès dans un environnement de production.
- Le proxy Kubernetes doit rester en cours d'exécution pour accéder au dashboard. Vous pouvez le lancer en arrière-plan ou dans un terminal séparé.
- Dans un environnement de production, vous devriez envisager des méthodes d'authentification plus sécurisées et potentiellement exposer le dashboard via un Ingress sécurisé.