# CCS3308- Virtualization and Containers
# Assignment 01
# 🐳 Docker-Based Flask + Redis Visit Counter

This project deploys a containerized web application using **Flask** (web server) and **Redis** (data store). The app tracks how many times a user visits the homepage and persists this count using Docker volumes.

---

## 📦 Deployment Requirements

Install the following software before running this project:

- **Docker** – Required to build and run containers  
  👉 [Install Docker](https://docs.docker.com/get-docker/)

- **Docker Compose** *(optional)* – For easier container orchestration  
  👉 [Install Docker Compose](https://docs.docker.com/compose/install/)

- **Bash Shell** – To execute the automation scripts  
  (Default in most Linux/Ubuntu systems)

---

## 📝 Application Description

The application is a web-based **visit counter**. Every time a user accesses the homepage (`/`), the Flask app:

- Connects to Redis
- Increments a `visits` counter
- Displays the updated count in the browser

This count is stored **persistently** using a Docker volume attached to Redis.

---

## 🌐 Network and Volume Details

- **Docker Network:**  
  `app-network` (custom bridge network)  
  Enables internal communication between Flask and Redis containers.

- **Docker Volume:**  
  `redis-data`  
  Stores Redis database files so that the counter value remains even after containers are stopped or restarted.

---

## ⚙️ Container Configuration

### `redis_db` (Redis Service)
- Image: `redis:alpine`
- Port: `6379`
- Startup Argument: `redis-server --appendonly yes`
- Volume: `redis-data`
- Restart Policy: `always`

### `flask_app` (Web Service)
- Built from local `./app` directory using `Dockerfile`
- Port: `5000`
- Environment Variable: `REDIS_HOST=redis_db`
- Depends on: `redis_db`
- Restart Policy: `always`

---

## 📋 Container List

| Container Name | Role             | Port   | Volume       | Network      |
|----------------|------------------|--------|--------------|--------------|
| `redis_db`     | Redis Server     | 6379   | `redis-data` | `app-network` |
| `flask_app`    | Flask Web Server | 5000   | None         | `app-network` |

---

## 🚀 Instructions

### 🔧 Prepare the Application
 - bash
 - ./prepare-app.sh
 - ./start-app.sh
 - http://localhost:5000
 - ./stop-app.sh
 - ./remove-app.sh


 # Example Workflow

```bash
./prepare-app.sh
# Create application resources
./prepare-app.sh
Preparing app ...

# Run the application
./start-app.sh
Running app ...
The app is available at http://localhost:5000

# Open a web browser and interact with the application
# URL: http://localhost:5000

# Pause the application
./stop-app.sh
Stopping app ...

# Delete all application resources
./remove-app.sh
Removed app.



