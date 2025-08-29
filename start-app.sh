#!/bin/bash
docker run -d --name redis_db --network app-network -p 6379:6379 --restart always -v redis-data:/data redis:alpine redis-server --appendonly yes
docker run -d --name flask_app --network app-network -p 5000:5000 --restart always -e REDIS_HOST=redis_db flask-counter-app
echo "App running at http://localhost:5000"
