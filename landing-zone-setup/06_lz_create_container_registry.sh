#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Enabling containerregistry services in the '$PROJECT_ID '.                 |
+----------------------------------------------------------------------------+
"
gcloud services enable containerregistry.googleapis.com
