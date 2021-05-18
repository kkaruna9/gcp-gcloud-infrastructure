#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Please wait as the code is being pushed to your cloud source repositories. |
| (This will take approx. 3-5 minutes.)                                      |
+----------------------------------------------------------------------------+
"
export REPO_PATH="https://source.developers.google.com/p/"$GOOGLE_CLOUD_PROJECT"/r/"

export FRONTEND_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-aut-frontend"
export BACKEND_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-aut-backend"
export DASHBOARD_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-report-dashboard"
export FUNCTIONAL_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-functional-assurance"
export PERFORMANCE_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-tests-performance"
export SECURITY_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-tests-security"
export ACCESSIBILITY_REPO=$REPO_PATH$LZ_REPOPREFIX"-gcp-tests-accessibility"


#gsutil cp gs://gd-investments-1000311198.appspot.com gs://artifacts.$PROJECT_ID/gcpworkshop-code-repos

#download all repos
#gsutil -mq cp -r gs://gd-investments-1000311198.appspot.com/gcpworkshop-code-repos .
gsutil -mq cp -r gs://$LZ_PROJECT_ID.appspot.com/gcpworkshop-code-repos .
cd gcpworkshop-code-repos

#frontend repo

cd gcpworkshop-aut-frontend
git init
git add .
git commit -m "init commit"  --quiet
git remote add origin $FRONTEND_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-aut-frontend' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-aut-frontend' repository"
fi
cd ..

# backend repo

cd gcpworkshop-aut-backend
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $BACKEND_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-aut-backend' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-aut-backend' repository"
fi
cd ..

#dashboard repo
cd gcpworkshop-report-dashboard
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $DASHBOARD_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-report-dashboard' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-report-dashboard' repository"
fi
cd ..

#functional test repo
cd gcpworkshop-functional-assurance
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $FUNCTIONAL_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-functional-assuran' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-functional-assuran' repository"
fi
cd ..

#nft - performance repo
cd gcpworkshop-tests-performance
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $PERFORMANCE_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-tests-performance' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-tests-performance' repository"
fi
cd ..

#nft - security repo
cd gcpworkshop-tests-security
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $SECURITY_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-tests-security' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-tests-security' repository"
fi
cd ..

#nft - accessbility repo
cd gcpworkshop-tests-accessibility
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $ACCESSIBILITY_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$LZ_REPOPREFIX-gcp-tests-accessibility' repository"
else
  echo "Failed to push code into '$LZ_REPOPREFIX-gcp-tests-accessibility' repository"
fi

echo "
+----------------------------------------------------------------------------+
| All the code repositories are now pushed to your GCP cloud source          |
+----------------------------------------------------------------------------+
"
