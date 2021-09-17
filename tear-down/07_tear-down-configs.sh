
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Configurations  >>>>>>>>>>>>>>>>>>>>>>>>>"

gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Project folders  >>>>>>>>>>>>>>>>>>>>>>>>>"
rm -rf temp/
rm -rf *
if [ $? -eq 0 ]
then
  echo "Deleted temp folder"
else
  echo "Failed to Delete temp folder"
fi