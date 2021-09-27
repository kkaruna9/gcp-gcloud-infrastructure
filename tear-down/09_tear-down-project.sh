#!/bin/sh
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Project Deletion >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh
gcloud projects delete $PROJECT_ID -q
if [ $? -eq 0 ]
then
  echo "Project '$PROJECT_ID' deleted"
else
  echo "Project deletion failed for '$PROJECT_ID'"
fi