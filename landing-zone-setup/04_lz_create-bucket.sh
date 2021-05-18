#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Creating cloud storage bucket in the '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+
"
#gsutil -q mb -p $LZ_PROJECT_ID -c $LZBUCKET_STORAGE_CLASS -l $LZ_BUCKET_LOCATION -b on gs://$LZ_BUCKET_NAME
gsutil mb gs://$BUCKET_NAME
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$LZ_BUCKET_NAME' "
else
  echo "Storage bucket creation failed for the bucket '$LZ_BUCKET_NAME' "