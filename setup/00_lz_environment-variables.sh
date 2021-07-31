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
export LZ_REPOPREFIX="lz-repo-3"
export DEFAULT_ZONE="us-central1-c"
export DEFAULT_REGION="US-EAST1"
export DEFAULT_CLUSTER_QEA="gcp-qea-server"
export DEFAULT_CLUSTER_VERSION="1.18.20-gke.900"
export DEFAULT_CLUSTER_APP="gcp-app-server"
export DEFAULT_CONFIG_NAME="WORKSHOP_CONFIG"

# Host IPs
export DEFAULT_GRID_IP=""
export DEFAULT_DASHBOARD_IP=""
export DEFAULT_MSSQL_IP=""
export DEFAULT_SONAR_IP=""
export DEFAULT_API_HOST=""
export DEFAULT_APPLICATION_HOST=""


# Bucket Variables
export DEFAULT_BUCKET_STORAGE_CLASS="STANDARD"
export DEFAULT_BUCKET_REPO="lz-artifacts-"
#export DEFAULT_BUCKET_REPORTS="lz-reports"
export DEFAULT_BUCKET_REPORTS_SOURCE="lz-artifacts-qea-sandbox/gcp-workshop-reports"
export DEFAULT_BUCKET_REPORTS_DEST="lz-reportsqea-sandbox"
#export LZ_BUCKET_NAME="lz-results" should be dynamically changed
export LZ_BUCKET_NAME="lz-reportsqea-sandbox"
export REPORTS_APITEST="APITest"
export REPORTS_RWDTEST="RWDTest"
export REPORTS_SMOKE="Smoke"
export REPORTS_UITEST="UITest"

# SonarQube
export SONAR_NAME="sonarqube-1"

# Kubernetes Services - default namespaces
export KUBECTL_SONARQUBE="sonarqube"
export KUBECTL_GRID="zalenium"
export KUBECTL_GRID_RELEASE="release-zalenium"
export KUBECTL_MSSQL="mssql-container"
export KUBECTL_RDASHBAORD="reporting-dashboard"
export KUBECTL_FRONTEND_APP="frontend-app"


# Repository
export REPO_PATH="https://source.developers.google.com/p/"$GOOGLE_CLOUD_PROJECT"/r/"
export FRONTEND_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-aut-frontend"
export BACKEND_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-aut-backend"
export DASHBOARD_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-report-dashboard"
export FUNCTIONAL_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-functional-assurance"
export PERFORMANCE_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-tests-performance"
export SECURITY_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-tests-security"
export ACCESSIBILITY_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-tests-accessibility"

export PRE_BUILD_QA="landing-zone-pre-buildQA"
export PRE_BUILD_QA_DEST_LOCAL_PATH="temp/landing-zone-pre-buildQA"


# Default Git
git config --global user.email a.dinesh1901@gmail.com
git config --global user.name dinesh-akrishnan

npm install mssql
npm install shelljs


