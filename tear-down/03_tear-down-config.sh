

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Configuration >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME
if [ $? -eq 0 ]
then
  echo "Deleted Global configuration Successfully  '$DEFAULT_CLUSTER_QEA_SERVER'"
else
  echo "Failed to Delete Global Configuration '$DEFAULT_CLUSTER_QEA_SERVER"
fi