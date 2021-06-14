#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Teardown GCP Components, Services, Buckets, Servers and repositories.      |
+----------------------------------------------------------------------------+
"

export DEFAULT_CONFIG_NAME="WORKSHOP_CONFIG"
export KUBECTL_SONARQUBE="sonarqube"
export KUBECTL_GRID="zalenium"
export KUBECTL_GRID_RELEASE="release-zalenium"
export KUBECTL_MSSQL="mssql-container"
export KUBECTL_RDASHBAORD="reporting-dashboard"
export KUBECTL_FRONTEND_APP="frontend-app"
export $DEFAULT_ZONE=

gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME
kubectl delete namespaces $KUBECTL_SONARQUBE
kubectl delete namespaces $KUBECTL_GRID
kubectl delete namespaces $KUBECTL_RDASHBAORD

gcloud container clusters delete $DEFAULT_CLUSTER_QEA --region=$DEFAULT_ZONE
if [ $? -eq 0 ]
then
  echo "Cluster Deleted Successfully  '$DEFAULT_CLUSTER_QEA'"
else
  echo "Failed to Delete Cluster '$DEFAULT_CLUSTER_QEA"
fi

export DEFAULT_BUCKET_REPORTS_DEST="lz-reportsqea-sandbox"
gsutil rm -r gs://$DEFAULT_BUCKET_REPORTS_DEST
if [ $? -eq 0 ]
then
  echo "Deleted Storage bucket  '$DEFAULT_BUCKET_REPORTS_DEST"
else
  echo "Failed to Delete Storage bucket '$DEFAULT_BUCKET_REPORTS_DEST"
fi


rm -rf temp
if [ $? -eq 0 ]
then
  echo "Deleted temp folder"
else
  echo "Failed to Delete temp folder"
fi