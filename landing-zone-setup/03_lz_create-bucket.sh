#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Creating cloud storage bucket in the '$PROJECT_ID '.                    |
+----------------------------------------------------------------------------+
"

gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_ZONE -b on gs://$DEFAULT_BUCKET_REPO$PROJECT_ID
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPO$PROJECT_ID' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPO$PROJECT_ID' "
fi


gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_ZONE -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPORTS$PROJECT_ID' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPORTS$PROJECT_ID' "
fi