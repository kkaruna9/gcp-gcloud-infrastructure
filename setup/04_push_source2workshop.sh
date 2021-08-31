#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Please wait as the code is being pushed to your cloud source repositories. |
|                 (This will take approx. 3-5 minutes.)                      |
+----------------------------------------------------------------------------+
"

#gsutil -mq cp -r gs://gd-investments-1000311198.appspot.com/gcpworkshop-code-repos .
#gsutil -mq cp -r gs://$PROJECT_ID/gcpworkshop-code-repos .
gsutil -mq cp -r gs://lz-artifacts-qea-sandbox/gcpworkshop-code-repos temp

cd temp/gcpworkshop-code-repos

#frontend repo

cd gcpworkshop-aut-frontend
git init
git add .
git commit -m "init commit"  --quiet
git remote add origin $FRONTEND_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$FRONTEND_REPO' repository"
else
  echo "Failed to push code into '$FRONTEND_REPO' repository"
fi
cd ..

# backend repo

cd gcpworkshop-aut-backend
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $AUT_BACKEND_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$AUT_BACKEND_REPO' repository"
else
  echo "Failed to push code into '$AUT_BACKEND_REPO' repository"
fi
cd ..

cd gcpworkshop-frontend
git init
git add .
git commit -m "init commit"  --quiet
git remote add origin $FRONTEND_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$AUT_FRONTEND_REPO' repository"
else
  echo "Failed to push code into '$AUT_FRONTEND_REPO' repository"
fi
cd ..

cd gcpworkshop-backend
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $BACKEND_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$BACKEND_REPO' repository"
else
  echo "Failed to push code into '$BACKEND_REPO' repository"
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
  echo "Code push success on '$DASHBOARD_REPO' repository"
else
  echo "Failed to push code into '$DASHBOARD_REPO' repository"
fi
cd ..

#functional test repo
cd gcpworkshop-tests-functional
git init
git add .
git commit -m "init commit" --quiet
git remote add origin $FUNCTIONAL_REPO
git push -u origin master --quiet
if [ $? -eq 0 ]
then
  echo "Code push success on '$FUNCTIONAL_REPO' repository"
else
  echo "Failed to push code into '$FUNCTIONAL_REPO' repository"
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
  echo "Code push success on '$PERFORMANCE_REPO' repository"
else
  echo "Failed to push code into '$PERFORMANCE_REPO' repository"
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
  echo "Code push success on '$SECURITY_REPO' repository"
else
  echo "Failed to push code into '$SECURITY_REPO' repository"
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
  echo "Code push success on '$ACCESSIBILITY_REPO' repository"
else
  echo "Failed to push code into '$ACCESSIBILITY_REPO' repository"
fi

cd


echo "
+----------------------------------------------------------------------------+
| All the code repositories are now pushed to your GCP cloud source          |
+----------------------------------------------------------------------------+
"
