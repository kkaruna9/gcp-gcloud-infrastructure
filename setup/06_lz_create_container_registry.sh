#!/bin/bash
echo "
+-----------------------------------------------------------------------------------+
|     Enabling container registry, container, cloudbuild, runtimeconfig services    |
+-----------------------------------------------------------------------------------+
"
gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable runtimeconfig.googleapis.com
