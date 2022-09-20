#!/bin/bash

docker build -t kamsodhi/automated-image:latest .
docker push kamsodhi/automated-image:latest

docker stop auto-container
docker rm auto-container

docker run -d -p 8080:8080 --name auto-container kamsodhi/automated-image:latest