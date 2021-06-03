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
export DEFAULT_ZONE="us-central1-c"
export DEFAULT_REGION="US-EAST1"
export DEFAULT_CLUSTER_QEA="gcp-qea-server"
export DEFAULT_CLUSTER_APP="gcp-app-server"
export DEFAULT_GRID_IP=""
export DEFAULT_DASHBOARD_IP=""
export DEFAULT_MSSQL_IP=""
export DEFAULT_SONAR_IP=""

export DEFAULT_API_HOST=""
export DEFAULT_APPLICATION_HOST=""
export DEFAULT_CONFIG_NAME="WORKSHOP_CONFIG"




# Bucket Variables
export DEFAULT_BUCKET_STORAGE_CLASS="STANDARD"
export DEFAULT_BUCKET_REPO="lz-artifacts-"
export DEFAULT_BUCKET_REPORTS="lz-reports"
export LZ_BUCKET_NAME="lz-results"
export REPORTS_APITEST="APITest"
export REPORTS_RWDTEST="RWDTest"
export REPORTS_SMOKE="Smoke"
export REPORTS_UITEST="UITest"

# SonarQube
export SONAR_NAME="sonarqube-1"


# Kubernetes Services - default namespaces
export KUBECTL_SONARQUBE="sonarqube"
export KUBECTL_GRID="zalenium"
export KUBECTL_MSSQL="mssql-container"
export KUBECTL_RDASHBAORD="reporting-dashboard"

git config --global user.email a.dinesh1901@gmail.com
git config --global user.name dinesh-akrishnan
