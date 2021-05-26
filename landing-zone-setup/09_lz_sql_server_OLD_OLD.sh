#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Creating SQL Server '$LZ_PROJECT_ID '.                                     |
+----------------------------------------------------------------------------+

"
export PROJECT_ID=$(gcloud config get-value project)
export LZ_PROJECT_ID=$(gcloud config get-value project)
gcloud beta container --project $LZ_PROJECT_ID clusters \
create "mssql-ag-gke-rk" --zone "us-west1-a" --username "admin" \
--cluster-version "1.18.17-gke.700" --machine-type "custom-2-4096" \
--image-type "COS" --disk-type "pd-standard" --disk-size "100" \
--num-nodes "2"  --additional-zones "us-west1-b"

gcloud container clusters get-credentials mssql-ag-gke-rk --zone=us-west1-a

kubectl create clusterrolebinding cluster-admin-binding \ --clusterrole cluster-admin --user dinesh-2.a-2@cognizant.com
kubectl create namespace mssql-ag
kubectl create secret generic sql-secrets --from-literal=sapassword="xxxxx" --from-literal=masterkeypassword="xxxxx"  --namespace mssql-ag
kubectl apply -f https://raw.githubusercontent.com/yogirk/mssql-ha-gke/master/operator.yaml --namespace mssql-ag
kubectl apply -f https://raw.githubusercontent.com/yogirk/mssql-ha-gke/master/sqlvolumes.yaml --namespace mssql-ag
kubectl apply -f https://raw.githubusercontent.com/yogirk/mssql-ha-gke/master/sqlserver.yaml --namespace mssql-ag
kubectl apply -f https://raw.githubusercontent.com/yogirk/mssql-ha-gke/master/mssql-ag-services.yaml --namespace mssql-ag

kubectl get services --namespace mssql-ag


