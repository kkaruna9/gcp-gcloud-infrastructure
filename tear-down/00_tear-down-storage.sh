#!/bin/sh
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Bucket Storages >>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh
gsutil rm -r gs://$DEFAULT_BUCKET_REPORTS_DEST
if [ $? -eq 0 ]
then
  echo "Deleted Storage bucket  '$DEFAULT_BUCKET_REPORTS_DEST"
else
  echo "Failed to Delete Storage bucket '$DEFAULT_BUCKET_REPORTS_DEST"
fi