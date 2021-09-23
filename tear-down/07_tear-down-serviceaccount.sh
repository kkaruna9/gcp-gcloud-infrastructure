#!/bin/bash
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Tear-Down Service Accounts >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud iam service-accounts delete $SA_NAME