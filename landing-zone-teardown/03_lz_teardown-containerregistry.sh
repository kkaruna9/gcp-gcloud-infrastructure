#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Disabling and deleting bucket storage for the workshop.                   |
+----------------------------------------------------------------------------+
"
gcloud services disable containerregistry.googleapis.com
