#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Creating cloud storage bucket in the '$PROJECT_ID '.                    |
+----------------------------------------------------------------------------+
"

#gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPO$PROJECT_ID
#if [ $? -eq 0 ]
#then
  #echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPO$PROJECT_ID' "
#else
  #echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPO$PROJECT_ID' "
#fi


gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPORTS$PROJECT_ID' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPORTS$PROJECT_ID' "
fi

gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_APITEST
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_APITEST' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_APITEST' "
fi
gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_RWDTEST
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_RWDTEST' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_RWDTEST' "
fi
gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_SMOKE
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_SMOKE' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_SMOKE' "
fi
gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_UITEST
if [ $? -eq 0 ]
then
  echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_UITEST' "
else
  echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPORTS$PROJECT_ID$REPORTS_UITEST' "
fi