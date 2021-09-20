#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                         Creating cloud VM Instance                         |
+----------------------------------------------------------------------------+
"
gcloud beta compute --project=$PROJECT_ID instances create $DEFAULT_CLUSTER_QEA_SERVER --zone=$DEFAULT_ZONE_SERVER --machine-type=e2-standard-8 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=$SA_NAME --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=debian-10-buster-v20210916 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-balanced --boot-disk-device-name=$DEFAULT_VM_NAME --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=an
gcloud beta compute ssh --zone $DEFAULT_ZONE_SERVER $DEFAULT_VM_NAME  --project $PROJECT_ID
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
docker info
docker run -d --name sonarqube -p 6002:9000 sonarqube:7.5-community
docker run --name reportingdashboard -p 3337:3337 --rm -i -t -d karthiknarayanpdec11/dashboardgcp:latest
docker pull elgalu/selenium
docker pull dosel/zalenium
docker run --rm -ti --name zalenium -p 4444:4444 \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /tmp/videos:/home/seluser/videos \
      --privileged dosel/zalenium start

