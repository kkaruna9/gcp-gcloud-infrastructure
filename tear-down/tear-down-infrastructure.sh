#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Teardown GCP Components, Services, Buckets, Servers and repositories.      |
+----------------------------------------------------------------------------+
"

export DEFAULT_CONFIG_NAME="WORKSHOP_CONFIG"
export DEFAULT_CLUSTER_QEA_SERVER="gcp-qea-server"
export DEFAULT_CLUSTER_QEA_APP="gcp-qea-app"
export DEFAULT_CLUSTER_QEA_CICD="gcp-qea-cicd"
export KUBECTL_SONARQUBE="sonarqube"
export KUBECTL_GRID="zalenium"
export KUBECTL_GRID_RELEASE="release-zalenium"
export KUBECTL_MSSQL="mssql-container"
export KUBECTL_RDASHBAORD="reporting-dashboard"
export KUBECTL_FRONTEND_APP="frontend-app"
export DEFAULT_ZONE="us-central1-c"
export DEFAULT_REGION="US-EAST1"
export DEFAULT_BUCKET_REPORTS_DEST=$BUCKET_ID

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP build tears >>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#gcloud beta builds triggers delete gcp-frontend-trigger -q
#gcloud beta builds triggers delete gcp-backend-trigger -q
gcloud beta builds triggers delete gcp-postbuild-trigger -q
gcloud beta builds triggers delete gcp-prebuild-trigger -q
#gcloud beta builds triggers delete gcp-bvt-trigger -q
gcloud beta builds triggers delete gcp-functional-SmokeTest -q
gcloud beta builds triggers delete gcp-functional-UITest -q
gcloud beta builds triggers delete gcp-functional-APITest -q
gcloud beta builds triggers delete gcp-functional-UIRWDTest -q
gcloud beta builds triggers delete gcp-experience-SecurityTest -q
gcloud beta builds triggers delete gcp-experience-AccessibilityTest -q
gcloud beta builds triggers delete gcp-experience-PerformanceTest -q


if [ $? -eq 0 ]
then
  echo "Deleted All the Triggers Successfully"
else
  echo "Failed to Delete Triggers"
fi


echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Configuration >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME
if [ $? -eq 0 ]
then
  echo "Deleted Global configuration Successfully  '$DEFAULT_CLUSTER_QEA_SERVER'"
else
  echo "Failed to Delete Global Configuration '$DEFAULT_CLUSTER_QEA_SERVER"
fi

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Source Repositories >>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/tear-down/tear-down-source-repositories.sh
if [ $? -eq 0 ]
then
  echo "Deleted All the source repositories"
else
  echo "Failed to Delete source repositories - please scroll up for error logs"
fi

#kubectl delete namespaces $KUBECTL_SONARQUBE
#kubectl delete namespaces $KUBECTL_GRID
#kubectl delete namespaces $KUBECTL_RDASHBAORD

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Bucket Storages >>>>>>>>>>>>>>>>>>>>>>>>>>"
gsutil rm -r gs://$DEFAULT_BUCKET_REPORTS_DEST
if [ $? -eq 0 ]
then
  echo "Deleted Storage bucket  '$DEFAULT_BUCKET_REPORTS_DEST"
else
  echo "Failed to Delete Storage bucket '$DEFAULT_BUCKET_REPORTS_DEST"
fi

#echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Kubernetes Namespaces >>>>>>>>>>>>>>>>>>>>>>>"
#kubectl delete namespace $KUBECTL_GRID
#kubectl delete namespace $KUBECTL_RDASHBAORD
#kubectl delete namespace $KUBECTL_MSSQL
#kubectl delete namespace $KUBECTL_SONARQUBE
#if [ $? -eq 0 ]
#then
#  echo "Kubernetes  namespaces Deleted successfully "
#else
 # echo "Failed to Delete Kubernetes  namespaces"
#fi


echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Kubernetes Cluster >>>>>>>>>>>>>>>>>>>>>>>"
gcloud container clusters delete $DEFAULT_CLUSTER_QEA_SERVER --region=$DEFAULT_ZONE_SERVER --async --quiet &
gcloud container clusters delete $DEFAULT_CLUSTER_QEA_APP --region=$DEFAULT_ZONE_APP --async --quiet &
if [ $? -eq 0 ]
then
  echo "Clusters Deleted Successfully  '$DEFAULT_CLUSTER_QEA_SERVER'  & '$DEFAULT_CLUSTER_QEA_APP'"
else
  echo "Failed to Delete Clusters '$DEFAULT_CLUSTER_QEA_SERVER'  & '$DEFAULT_CLUSTER_QEA_APP'"
fi

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Project folders  >>>>>>>>>>>>>>>>>>>>>>>>>"
rm -rf temp
if [ $? -eq 0 ]
then
  echo "Deleted temp folder"
else
  echo "Failed to Delete temp folder"
fi


