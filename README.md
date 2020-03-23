# DevSecOps
Setup a K8s cluster manually on Azure Portal (Azure Resource Group Name: K8s, cluser Name: DevSecOps)

Run following commands

az aks get-credentials --resource-group K8s --name DevSecOps

az aks browse --resource-group K8s --name DevSecOps

Test Locally on Laptop:
docker run -p 8080:80 direct2sanjeev/devsecops:devsecops

http://localhost:8080/api/values

http://localhost:8080/api/values/5

We Created Following Service connections in Azure Project to connect to various services in pipelines. 

DockerHubConnectionString - To connect to Docker Hub to push the Docker Images

K8sConnectionString - To connect to K8s cluster to deploy the verified images

GitHub - To connect to GitHub to compile the docker Images 


# Install SysDig via HELM:


helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm repo update

helm install sysdig --set sysdig.accessKey=<SYSDIG ACCESS KEY> stable/sysdig
