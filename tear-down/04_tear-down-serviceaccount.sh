#!/bin/bash
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Tear-Down Service Accounts >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
gcloud iam service-accounts delete $SA_NAME