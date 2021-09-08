#!/bin/bash
echo "
+-----------------------------------------------------------------------------------+
|     Enabling container registry, container, cloudbuild, runtimeconfig services    |
+-----------------------------------------------------------------------------------+
"
gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_SERVER --zone $DEFAULT_ZONE --project $PROJECT_ID

gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable runtimeconfig.googleapis.com

gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_APP --zone $DEFAULT_ZONE --project $PROJECT_ID

gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable runtimeconfig.googleapis.com

#gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_CICD --zone $DEFAULT_ZONE --project $PROJECT_ID

#gcloud services enable containerregistry.googleapis.com
#gcloud services enable container.googleapis.com
#gcloud services enable cloudbuild.googleapis.com
#gcloud services enable runtimeconfig.googleapis.com
