#!/bin/bash

echo "
+----------------------------------------------------------------------------+
|          Creating and Spinning up MSSQL SERVER 2019 for the workshop       |
|                 (This will take approx. 2 minutes.)                        |
+----------------------------------------------------------------------------+
"

gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA --zone $DEFAULT_ZONE --project $PROJECT_ID
kubectl create namespace $KUBECTL_MSSQL
kubectl get namespace
kubectl apply -f  "temp/gcp-gcloud-infrastructure/setup/mssql.yml" --namespace=$KUBECTL_MSSQL
bash -c external_ip="";
while [ -z $external_ip ];
do echo "Please Wait mssql-container Loading...";
external_ip=$(kubectl get svc mssql-container  --namespace=$KUBECTL_MSSQL --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$external_ip" ] && sleep 15; done; echo "End point ready-" && echo $external_ip; export endpoint=$external_ip

#kubectl get pod mssql-container --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
