#!/bin/sh
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Disabling all the services used for the workshop >>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud services disable sourcerepo.googleapis.com
gcloud services disable cloudresourcemanager.googleapis.com
gcloud services disable compute.googleapis.com
gcloud services disable container.googleapis.com
gcloud services disable containerregistry.googleapis.com
gcloud services disable cloudbuild.googleapis.com
gcloud services disable iam.googleapis.com
gcloud services disable logging.googleapis.com
gcloud services disable monitoring.googleapis.com
gcloud services disable storage-api.googleapis.com
gcloud services disable storage-component.googleapis.com
gcloud services disable sourcerepo.googleapis.com
gcloud services disable pubsub.googleapis.com
gcloud services disable runtimeconfig.googleapis.com

