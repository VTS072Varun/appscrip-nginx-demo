                  #Appscrip DevOps Assignment – NGINX on EKS with ArgoCD


#Project Structure

appscrip-nginx-demo/
├── terraform/ # Terraform files to provision EKS
├── manifests/ # Kubernetes manifests (NGINX deployment + service)
├── argocd/ # ArgoCD application resource
└── README.md # Instructions and deliverables

Steps to Provision the EKS cluster
Configure AWS CLI:

aws configure

Navigate to terraform/ and initialize:

cd terraform
terraform init
terraform apply

Once applied, export kubeconfig:

aws eks --region us-east-1 update-kubeconfig --name appscrip-cluster

ArgoCD Setup & Login
Install ArgoCD:
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

Port-forward ArgoCD:
kubectl port-forward svc/argocd-server -n argocd 8080:443

Access via browser:
https://localhost:8080

Get admin password:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

Username: admin
Password: OTNFaW1kWWxrWmV4ZElKeQ==

Deployed App Access (NGINX)
Method: LoadBalancer DNS
URL: http://3.219.159.156.sslip.io

This uses sslip.io to map the LoadBalancer IP to a public domain.

Ingress Domain Setup:

* Not used for this demo regarding the cost-related issue.
* DNS routing was achieved using sslip.io (free public DNS mapping based on IP).

ArgoCD App Configuration
The ArgoCD application YAML is located at:
argocd/nginx-app.yaml
* It syncs manifests/ from this repository.

Maintainer

Varun A S
Email: varunas181@gmail.com
GitHub: https://github.com/VTS072Varun