#!/bin/bash

echo "Creating images"

docker build -t denilsonbonatti/projeto-backend:1.0 backend/.
docker build -t denilsonbonatti/projeto-database:1.0 database/.

echo "Pushing images"

docker push denilsonbonatti/projeto-backend:1.0
docker push denilsonbonatti/projeto-database:1.0

echo "Creating cluster services"

kubectl apply -f ./service.yml

echo "Creating deployments"

kubectl apply -f ./deployment.yml