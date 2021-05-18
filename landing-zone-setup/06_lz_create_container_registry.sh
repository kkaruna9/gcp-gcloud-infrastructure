#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Enabling containerregistry services in the '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+
"
gcloud services enable containerregistry.googleapis.com
