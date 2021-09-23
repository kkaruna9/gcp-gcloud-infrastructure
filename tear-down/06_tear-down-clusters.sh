#!/bin/sh
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud container clusters delete $DEFAULT_CLUSTER_QEA_SERVER --region=$DEFAULT_ZONE_SERVER --async --quiet &
gcloud container clusters delete $DEFAULT_CLUSTER_QEA_APP --region=$DEFAULT_ZONE_APP --async --quiet &
if [ $? -eq 0 ]
then
  echo "Clusters Deleted Successfully  '$DEFAULT_CLUSTER_QEA_SERVER'  & '$DEFAULT_CLUSTER_QEA_APP'"
else
  echo "Failed to Delete Clusters '$DEFAULT_CLUSTER_QEA_SERVER'  & '$DEFAULT_CLUSTER_QEA_APP'"
fi
