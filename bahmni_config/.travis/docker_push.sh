#!/bin/bash
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker build bahmni_config/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:bahmn_config_$TRAVIS_COMMIT
docker build odoo/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:odoo_$TRAVIS_COMMIT
docker build openmrs/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:openmrs_$TRAVIS_COMMIT
docker build odoo-connect/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:odoo_connect_$TRAVIS_COMMIT
docker build metabase/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:metabase_$TRAVIS_COMMIT
docker build bahmniapps/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:bahmniapps_$TRAVIS_COMMIT
docker build bahmniapps/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:bahmniapps_$TRAVIS_COMMIT
for i in `docker images --format "{{.Repository}}:{{.Tag}}" | grep "$DOCKER_USERNAME/$DOCKER_REPOSITORY"`; do docker push $i; done