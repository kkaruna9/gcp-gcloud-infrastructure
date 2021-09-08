#!/bin/bash

echo "
+----------------------------------------------------------------------------+
|          Creating and Spinning up MSSQL SERVER 2019 for the workshop       |
|                 (This will take approx. 2 minutes.)                        |
+----------------------------------------------------------------------------+
"

gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_APP --zone $DEFAULT_ZONE --project $PROJECT_ID
kubectl create namespace $KUBECTL_MSSQL
kubectl get namespace
kubectl apply -f  "temp/gcp-gcloud-infrastructure/setup/mssql.yml"


#kubectl get pod mssql-container --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
