#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Creating and Spinning up MSSQL SERVER 2019 for the workshop                |
+----------------------------------------------------------------------------+
"

gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA --zone $DEFAULT_ZONE --project $PROJECT_ID
kubectl apply -f  "temp/gcp-gcloud-infrastructure/landing-zone-setup/mssql.yml"
bash -c external_ip="";
while [ -z $external_ip ];
do echo "Please Wait Loading...";
external_ip=$(kubectl get svc mssql-container --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$external_ip" ] && sleep 10; done; echo "End point ready-" && echo $external_ip; export endpoint=$external_ip

#kubectl get pod mssql-container --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
