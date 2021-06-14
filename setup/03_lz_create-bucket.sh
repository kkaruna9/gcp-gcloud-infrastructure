#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                   Creating cloud storage bucket                            |
+----------------------------------------------------------------------------+
"

#gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPO$PROJECT_ID
#if [ $? -eq 0 ]
#then
  #echo "Storage bucket created successfully with the name '$DEFAULT_BUCKET_REPO$PROJECT_ID' "
#else
  #echo "Storage bucket creation failed for the bucket '$DEFAULT_BUCKET_REPO$PROJECT_ID' "
#fi


#mkdir temp/FunctionalAssurance
#mkdir temp/FunctionalAssurance/APITest
#mkdir temp/FunctionalAssurance/Smoke
#mkdir temp/FunctionalAssurance/UIRWDTest
#mkdir temp/FunctionalAssurance/UITest
#mkdir temp/PostBuildQA
#mkdir temp/PostBuildQA/BVT
#mkdir temp/PostBuildQA/Smoke
#mkdir temp/PreBuildQA

#touch temp/FunctionalAssurance
#gsutil cp -r temp/FunctionalAssurance gs://lz-din-test
#touch temp/FunctionalAssurance/APITest
#gsutil cp gs://lz-reportsqea-sandbox gs://lz-dines-test
#gsutil cp -r gs://lz-reportsqea-sandbox gs://lz-dines-test/
#gsutil cp gs://gd-investments-1000311198.appspot.com gs://artifacts.$PROJECT_ID/gcpworkshop-code-repos
#-p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION

gsutil mb gs://$DEFAULT_BUCKET_REPORTS_DEST
gsutil cp -r gs://$DEFAULT_BUCKET_REPORTS_SOURCE gs://$DEFAULT_BUCKET_REPORTS_DEST
#gsutil -m  rm -r gs://lz-dines-test/gcp-workshop-reports/*.txt
#gsutil -m  rm -r gs://lz-dines-test/gcp-workshop-reports/FunctionalAssurance/*.txt


#gsutil -q mb -p $PROJECT_ID -c $DEFAULT_BUCKET_STORAGE_CLASS -l $DEFAULT_REGION -b on gs://$DEFAULT_BUCKET_REPORTS$PROJECT_ID
