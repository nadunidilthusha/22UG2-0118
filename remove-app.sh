#!/bin/bash
docker rm -f flask_app redis_db
docker rmi flask-counter-app
docker volume rm redis-data
docker network rm app-network
