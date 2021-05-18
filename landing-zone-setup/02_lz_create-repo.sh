#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Creating cloud source repositories for the '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+
"

gcloud -q source repos create $LZ_REPOPREFIX-landling-zone
if [ $? -eq 0 ]
then
  echo "Created '$LZ_REPOPREFIX-landling-zone' repository"
else
  echo "Failed to create '$LZ_REPOPREFIX-landling-zone' repository"


