#!/bin/sh
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Bucket Storages >>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh
gsutil rm -r gs://$BUCKET_ID
if [ $? -eq 0 ]
then
  echo "Deleted Storage bucket  '$BUCKET_ID"
else
  echo "Failed to Delete Storage bucket '$BUCKET_ID"
fi