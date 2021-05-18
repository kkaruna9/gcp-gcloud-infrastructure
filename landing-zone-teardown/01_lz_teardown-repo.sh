#!/bin/bash



echo "
+----------------------------------------------------------------------------+
| Deleting cloud source repositories created for workshop.                   |
+----------------------------------------------------------------------------+
"
gcloud -q source repos delete $REPOPREFIX-gcp-aut-frontend
if [ $? -eq 0 ]
then
  echo "Deleted '$REPOPREFIX-gcp-aut-frontend' repository"
else
  echo "Failed to delete '$REPOPREFIX-gcp-aut-frontend' repository"