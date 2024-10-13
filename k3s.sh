# https://docs.k3s.io/quick-start
# curl -sfL https://get.k3s.io | sh -

# Install Kubernetes Dashboard
sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml


#dashboard.admin-user.yml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard


#dashboard.admin-user-role.yml
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


# commands below
sudo kubectl create -f dashboard.admin-user.yml -f dashboard.admin-user-role.yml
# Get token for loging in to dashboard 
sudo kubectl -n kubernetes-dashboard create token admin-user
sudo env EDITOR=nano kubectl edit service kubernetes-dashboard -n kubernetes-dashboard

sudo kubectl get service kubernetes-dashboard -n kubernetes-dashboard


#install helm 
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Harbor container
https://github.com/goharbor/harbor-helm

# Install harbor via helm 
helm install myharbor harbor/harbor --set expose.type=nodePort --set expose.tls.auto.commonName=test --set expose.tls.enabled=false

#default user and pass 
admin
Harbor12345
