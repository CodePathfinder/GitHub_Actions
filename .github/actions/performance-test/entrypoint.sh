#!/bin/bash
# add here your code for performance testing script
pip install locust
docker run --name hello-ai -d -p 8080:8080 hello-ai:$5
sleep 10 # wait for app to start
locust -f locustfile.py --headless -u $1 -r $2 -t $3 --host $4
docker stop hello-ai
