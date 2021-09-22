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




#kubectl delete namespaces $KUBECTL_SONARQUBE
#kubectl delete namespaces $KUBECTL_GRID
#kubectl delete namespaces $KUBECTL_RDASHBAORD

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
source temp/gcp-gcloud-infrastructure/tear-down/00_tear-down-storage.sh
source temp/gcp-gcloud-infrastructure/tear-down/01_tear-down-source-repositories.sh
source temp/gcp-gcloud-infrastructure/tear-down/02_tear-down-triggers.sh
source temp/gcp-gcloud-infrastructure/tear-down/03_tear-down-config.sh
source temp/gcp-gcloud-infrastructure/tear-down/04_tear-down-firewall.sh
source temp/gcp-gcloud-infrastructure/tear-down/05_tear-down-vm.sh
source temp/gcp-gcloud-infrastructure/tear-down/06_tear-down-clusters.sh
source temp/gcp-gcloud-infrastructure/tear-down/07_tear-down-serviceaccount.sh
source temp/gcp-gcloud-infrastructure/tear-down/08_tear-down-gcpservices.sh
source temp/gcp-gcloud-infrastructure/tear-down/09_tear-down-project.sh
source temp/gcp-gcloud-infrastructure/tear-down/10_tear-down-folders.sh

