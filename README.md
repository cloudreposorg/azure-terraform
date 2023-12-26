# Project Title
This project is intended to provision infrastructure on Azure.
# Pre-Requisites
* Step 1: Download terraform utility
```
https://www.terraform.io/downloads -> unzip file -> terraform.exe
```
* Step 2: Edit the system environment variables
```
System variables -> click on Path -> enter terraform.exe file path -> New -> Ok 
```
* Step 3: Authentication to Azure
```
Service principal creation=>Azure active directory => App registrations => New registration -> Name : mysp(any name we can give) -> Register -> Certificates & secrets -> Client secrets -> New client secret -> Add -> copy client secret value

Assiging Permission for the above service princiap mysp to create resources in Azure => Subscription => IAM => Add -> add role assignment -> Role => Privileged administrator roles=> contributor -> members -> select members => select: <<mysp>> => click on Review + assign

export ARM_TENANT_ID="" && export ARM_SUBSCRIPTION_ID="" && export ARM_CLIENT_ID="" && export ARM_CLIENT_SECRET=""
```
# Execution Flow
* Step 1: Clone repo
```
git clone https://github.com/cloudreposorg/azure-terraform.git && cd azure-terraform.git
```
* Step 2: Modify cluster config as per requirement in azure_dev_cluster.json file
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```
* Step 3: Provision infra
```
terraform init .
terraform validate --var-file=azure_dev_cluster.json
terraform apply --var-file=azure_dev_cluster.json
```
* Step 4: Post provision steps
```
login to bastionhost
eval `ssh-agent` && ssh-add -k ~/.ssh/id_rsa && ssh -A azure-user@PUBLIC_IP
login to webapp server
ssh azure-user@private_ip
or
Use browser based Bastionhost from portal to webapp server
sudo yum install python3-pip -y && sudo pip3 install gunicorn && sudo pip3 install django
sudo vi /usr/local/lib64/python3.6/site-packages/django/db/backends/sqlite3/base.py (line 67 replace > with ==)
sudo yum install git -y && sudo git clone https://github.com/devops2023q2/webapp.git && cd webapp && sudo pip3 install -r requirements.txt
gunicorn main.wsgi --bind 0.0.0.0:8000
```
* Step 5: Testing
```
lb_ip:8000
```