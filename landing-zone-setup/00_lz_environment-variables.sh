#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   Environment variable creation                            |
+----------------------------------------------------------------------------+
"
# git clone https://github.com/dinesh-akrishnan/gcp-gcloud-infrastructure.git
# cd gcp-gcloud-infrastructure
# cd landing-zone-setup
# sh ./00_lz_environment-variables.sh
# sh ./02_lz_create-repo.sh

#  Latest QEA-SANDBOX Execution
#  git clone https://github.com/dinesh-akrishnan/gcp-gcloud-infrastructure.git
#  source sh ./00_lz_environment-variables.sh

# Common  Variables
export PROJECT_ID=$(gcloud config get-value project)
export LZ_REPOPREFIX="lz-repo-2"
export DEFAULT_ZONE="US-EAST1"
export DEFAULT_CLUSTER_QEA="GCPQEAServer"
export DEFAULT_CLUSTER_APP="GCPAppServer"



# Bucket Variables
export DEFAULT_BUCKET_STORAGE_CLASS="STANDARD"
export DEFAULT_BUCKET_REPO="lz-artifacts-"
export DEFAULT_BUCKET_REPORTS="lz-reports"
export LZ_BUCKET_NAME="lz-results"

# SonarQube
export SONAR_NAME="sonarqube-1"


# Kubernetes Services - default namespaces
export KUBECTL_SONARQUBE="sonarqube"
export KUBECTL_GRID="zalenium"
export KUBECTL_MSSQL="mssql-container"
export KUBECTL_RDASHBAORD="reporting-dashboard"

git config --global user.email a.dinesh1901@gmail.com
git config --global user.name dinesh-akrishnan
