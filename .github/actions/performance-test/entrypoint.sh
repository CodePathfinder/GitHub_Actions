#!/bin/bash
# add here your code for performance testing script
docker run --name hello-ai -d -p 8080:8080 $1
# Wait for the application to start
sleep 10
# Run Locust performance tests
locust -f .github/workflows/locustfile.py --headless --users 50 --spawn-rate 10 --host http://localhost:8080 --run-time 30s
# Stop the Docker container
docker stop hello-ai