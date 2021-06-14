#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Deleting bucket storage for the workshop.                   |
+----------------------------------------------------------------------------+
"

gsutil rm -r gs://$BUCKET_NAME
if [ $? -eq 0 ]
then
  echo "Deleted Storage bucket  '$BUCKET_NAME"
else
  echo "Failed to Delete Storage bucket '$BUCKET_NAME"
fi