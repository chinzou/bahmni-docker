#!/bin/bash
echo fine
Services=appointments,bahmni-mart,bahmni-reports,bahmniapps,implementer-interface,metabase,odoo,odoo-connect,openmrs

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

for service in ${Services//,/ }
do
    echo "building $service $TRAVIS_CPU_ARCH image"
    docker build ${service}/ -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:${service}_$(git rev-parse --short HEAD)_$TRAVIS_CPU_ARCH
    echo "pushing $service $TRAVIS_CPU_ARCH image"
    docker push $DOCKER_USERNAME/$DOCKER_REPOSITORY:${service}_$(git rev-parse --short HEAD)_$TRAVIS_CPU_ARCH
done
