#!/bin/bash
docker build -t flask-counter-app ./app
docker volume create redis-data
docker network create app-network
