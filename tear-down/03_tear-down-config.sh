#!/bin/sh

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Configuration >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME
if [ $? -eq 0 ]
then
  echo "Deleted Global configuration Successfully  '$DEFAULT_CONFIG_NAME'"
else
  echo "Failed to Delete Global Configuration '$DEFAULT_CONFIG_NAME"
fi