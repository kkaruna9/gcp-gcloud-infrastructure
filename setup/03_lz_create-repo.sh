#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                         Creating cloud source repositories                 |
+----------------------------------------------------------------------------+
"
gcloud services enable sourcerepo.googleapis.com

#gcloud -q source repos create $LZ_REPOPREFIX-landing-zone
#if [ $? -eq 0 ]
#then
#  echo "Created '$LZ_REPOPREFIX-landing-zone' repository"
#else
#  echo "Failed to create '$LZ_REPOPREFIX-landing-zone' repository"
#fi
(gsutil -mq cp -r gs://lz-artifacts-qea-sandbox/gcpworkshop-code-repos temp) |
(
gcloud -q source repos create $LZ_REPOPREFIX-gcp-frontend
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-frontend' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-frontend' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-backend
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-backend' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-backend' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-report-dashboard
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-report-dashboard' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-report-dashboard' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-tests-functional
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-tests-functional' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-tests-functional' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-tests-performance
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-tests-performance' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-tests-performance' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-tests-security
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-tests-security' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-tests-security' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-tests-accessibility
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-tests-accessibility' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-tests-accessibility' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-landing-zone-pre-buildQA
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-landing-zone-pre-buildQA' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-landing-zone-pre-buildQA' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-landing-zone-functional
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-landing-zone-functional' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-landing-zone-functional' repository"
fi
)
