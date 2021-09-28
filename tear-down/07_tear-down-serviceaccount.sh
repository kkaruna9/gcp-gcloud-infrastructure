#!/bin/bash
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Tear-Down Service Accounts >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud iam service-accounts delete $SERVICE_ACCOUNT --quiet
if [ $? -eq 0 ]
then
  echo "Service Account '$SERVICE_ACCOUNT' is deleted"
else
  echo "Failed to delete Service Account '$SERVICE_ACCOUNT'"
fi