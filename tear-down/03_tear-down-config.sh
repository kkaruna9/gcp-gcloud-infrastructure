

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Configuration >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME
if [ $? -eq 0 ]
then
  echo "Deleted Global configuration Successfully  '$DEFAULT_CONFIG_NAME'"
else
  echo "Failed to Delete Global Configuration '$DEFAULT_CONFIG_NAME"
fi