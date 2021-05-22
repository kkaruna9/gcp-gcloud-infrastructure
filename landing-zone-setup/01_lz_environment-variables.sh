#!/bin/sh
echo "
+----------------------------------------------------------------------------+
| Environment variable creation  '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+
"
# git clone https://github.com/dinesh-akrishnan/gcp-gcloud-infrastructure.git
# cd gcp-gcloud-infrastructure
# cd landing-zone-setup
# sh ./01_lz_environment-variables.sh
# sh ./02_lz_create-repo.sh
export LZ_REPOPREFIX="lz-repo-2"
export LZ_BUCKET_NAME="lz-results"
export LZ_BUCKET_LOCATION="US-EAST1"
export LZ_BUCKET_STORAGE_CLASS="STANDARD"
export LZ_BUCKET_REPO="lz-artifacts"
export LZ_PROJECT_ID=$(gcloud config get-value project)
echo $LZ_REPOPREFIX
echo $LZ_BUCKET_NAME
echo $LZ_BUCKET_LOCATION
echo $LZ_BUCKET_STORAGE_CLASS
echo $LZ_BUCKET_REPO
echo $LZ_PROJECT_ID

#git config --global user.email
#git config --global user.name $GIT-USER-NAME
