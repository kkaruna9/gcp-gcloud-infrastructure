#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                         Creating cloud source repositories                 |
+----------------------------------------------------------------------------+
"

gcloud -q source repos create $LZ_REPOPREFIX-landling-zone
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-landling-zone' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-landling-zone' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-aut-frontend
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-aut-frontend' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-aut-frontend' repository"
fi

gcloud -q source repos create $LZ_REPOPREFIX-gcp-aut-backend
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-aut-backend' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-aut-backend' repository"
fi

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

gcloud -q source repos create $LZ_REPOPREFIX-gcp-functional-assurance
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-gcp-functional-assurance' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-gcp-functional-assurance' repository"
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
