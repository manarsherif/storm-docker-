#!/bin/bash
#run jason file in marathon 
#curl -H "Content-Type: application/json"  -d @marathon/storm.json http://localhost:8080/v2/apps
#curl -H "Content-Type: application/json"  -d @marathon/test.json http://master:8080/v2/apps
curl -i -H "Content-Type: application/json"  -d @marathon/test.json http://master:8080/v2/apps
