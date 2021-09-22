

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP VM Instance >>>>>>>>>>>>>>>>>>>>>>>>>>>>"

gcloud compute instances delete $DEFAULT_CLUSTER_QEA_SERVER --zone=$DEFAULT_ZONE_SERVER
if [ $? -eq 0 ]
then
  echo "Deleted VM Instance '$DEFAULT_CLUSTER_QEA_SERVER' from zone '$DEFAULT_ZONE_SERVER'"
else
  echo "Deleted VM Instance '$DEFAULT_CLUSTER_QEA_SERVER' from zone '$DEFAULT_ZONE_SERVER'"
fi