#!/bin/bash

echo "
+----------------------------------------------------------------------------+
|          Creating and Spinning up MSSQL SERVER 2019 for the workshop       |
|                 (This will take approx. 2 minutes.)                        |
+----------------------------------------------------------------------------+
"
npm install mssql
npm install shelljs

gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_APP --zone $DEFAULT_ZONE_APP --project $PROJECT_ID
kubectl create namespace $KUBECTL_MSSQL
kubectl get namespace
kubectl apply -f  "temp/gcp-gcloud-infrastructure/setup/mssql.yml"

bash -c external_mysqlip="";
while [ -z $external_mysqlip ];
do echo "Please Wait - MSSQL is Loading...";
external_mysqlip=$(kubectl get svc $KUBECTL_MSSQL --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$external_mysqlip" ] && sleep 15; done; echo "End point ready-" && echo $external_mysqlip; export endpoint=external_mysqlip



#kubectl get pod mssql-container --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
