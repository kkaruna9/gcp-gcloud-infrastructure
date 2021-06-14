#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Zone Microsoft SQL Server Installation                                     |
+----------------------------------------------------------------------------+

"
#helm install --name mymssql stable/mssql-linux --set acceptEula.value=Y --set edition.value=Developer
export MSSQL_NAME="mssql-1"
export PROJECT_ID=$(gcloud config get-value project)
gcloud container clusters get-credentials spinnaker-ci-cd --zone us-east1-c --project $PROJECT_ID
kubectl create namespace mssql
helm repo update
helm install mymssql stable/mssql-linux --set acceptEula.value=Y --set edition.value=Developer
helm install --set acceptEula.value=Y --set edition.value=Developer stable/mssql-linux --generate-name
export SERVICE_IP=$(kubectl -n mssql-1 get svc $MSSQL_NAME-mssql -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo http://$SERVICE_IP:9000

#Sprintf $(kubectl get secret --namespace default mssql-linux-1621781957-secret -o jsonpath="{.data.sapassword}" | base64 --decode);echo
#Sou0U2rdylSLEJADHyOL
#kubectl run mssqlcli --image=microsoft/mssql-tools -ti --restart=Never --rm=true -- /bin/bash
#sqlcmd -S mssql-linux-1621781957.default,1433 -U sa
#Password:

kubectl run mssql-container --image=mcr.microsoft.com/mssql/server:2019-latest -ti --restart=Never --rm=true -- /bin/bash

kubectl run -it –rm –image=mysql:5.6 –restart=Never mysql-client — mysql -h mysql -ppassword
