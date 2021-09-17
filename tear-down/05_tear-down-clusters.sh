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