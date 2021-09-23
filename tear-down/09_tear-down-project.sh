#!/bin/sh
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Project Deletion >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud projects delete $PROJECT_ID -q