# https://docs.k3s.io/quick-start
# curl -sfL https://get.k3s.io | sh -

https://medium.com/@satyakommula/deploy-kubernetes-dashboard-with-nodeport-382f447d2ff8

# Install Kubernetes Dashboard
sudo kubectl apply -f ./recommended.yaml

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

export KUBECONFIG=~/.kube/config
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"
You can add KUBECONFIG=~/.kube/config to your ~/.profile or ~/.bashrc to make it persist on reboot.


#install helm 
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

https://vishynit.medium.com/setting-up-harbor-registry-on-kubernetes-using-helm-chart-5989d7c8df2a
Step 1: Add the Harbor Helm Repository
First, add the Harbor Helm repository to your Helm client:

helm repo add harbor https://helm.goharbor.io
helm repo update
Step 2: Create a Namespace for Harbor
Create a dedicated namespace for Harbor to keep things organized:

kubectl create namespace harbor
Step 3: Install Harbor with Helm
You can install Harbor with the default configuration using the following command:

helm install harbor harbor/harbor --namespace harbor

# Harbor container
https://github.com/goharbor/harbor-helm

# Install harbor via helm 
helm install myharbor harbor/harbor --set expose.type=nodePort --set expose.tls.auto.commonName=test --set expose.tls.enabled=false --namespace=harbor --set harborAdminPassword=notes --create-namespace --set externalURL=http://k3s-1.localdomain:30002
helm install myharbor harbor/harbor --set expose.type=nodePort --set expose.tls.auto.commonName=test --set expose.tls.enabled=false --namespace=harbor --set harborAdminPassword=notes --create-namespace --set externalURL=http://k3s-2.localdomain:30002
helm install myharbor harbor/harbor --set expose.type=nodePort --set expose.tls.auto.commonName=test --set expose.tls.enabled=false --namespace harbor
helm install myharbor harbor/harbor --set expose.type=nodePort --set expose.tls.auto.commonName=test --set expose.tls.enabled=false

#default user and pass 
admin
Harbor12345
