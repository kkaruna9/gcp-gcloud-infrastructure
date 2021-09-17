#!/bin/bash
echo "
+-----------------------------------------------------------------------------------+
|     Enabling container registry, container, cloudbuild, runtimeconfig services    |
+-----------------------------------------------------------------------------------+
"

gcloud services enable sourcerepo.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable containerregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable logging.googleapis.com
gcloud services enable monitoring.googleapis.com
gcloud services enable storage-api.googleapis.com
gcloud services enable storage-component.googleapis.com
gcloud services enable sourcerepo.googleapis.com
gcloud services enable pubsub.googleapis.com
gcloud services enable runtimeconfig.googleapis.com


gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_SERVER --zone $DEFAULT_ZONE_SERVER --project $PROJECT_ID

gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable runtimeconfig.googleapis.com

gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_APP --zone $DEFAULT_ZONE_APP --project $PROJECT_ID

gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable runtimeconfig.googleapis.com

#gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_CICD --zone $DEFAULT_ZONE --project $PROJECT_ID

#gcloud services enable containerregistry.googleapis.com
#gcloud services enable container.googleapis.com
#gcloud services enable cloudbuild.googleapis.com
#gcloud services enable runtimeconfig.googleapis.com
