#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| GCP Landing | Creating cloud storage bucket in the '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+
"
export LZ_PROJECT_ID=$(gcloud config get-value project)
export LZ_BUCKET_STORAGE_CLASS="STANDARD"
export LZ_BUCKET_LOCATION="US-EAST1"
export LZ_BUCKET_REPO="lz-artifacts-"
export LZ_BUCKET_REPORTS="lz-reports"
gsutil -q mb -p $LZ_PROJECT_ID -c $LZ_BUCKET_STORAGE_CLASS -l $LZ_BUCKET_LOCATION -b on gs://$LZ_BUCKET_REPO$LZ_PROJECT_ID
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$LZ_BUCKET_REPO$LZ_PROJECT_ID' "
else
  echo "Storage bucket creation failed for the bucket '$LZ_BUCKET_REPO$LZ_PROJECT_ID' "
fi
gsutil -q mb -p $LZ_PROJECT_ID -c $LZ_BUCKET_STORAGE_CLASS -l $LZ_BUCKET_LOCATION -b on gs://$LZ_BUCKET_REPORTS$LZ_PROJECT_ID
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$LZ_BUCKET_REPORTS$LZ_PROJECT_ID' "
else
  echo "Storage bucket creation failed for the bucket '$LZ_BUCKET_REPORTS$LZ_PROJECT_ID' "clear

fi