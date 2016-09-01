#!/bin/bash
cd docker
#builds an images like make  bla bla bla 
#docker build --no-cache -t=mesos/storm:latest .
#docker push mesos/storm-nimbus:0.10.1
#docker build --no-cache -t=mesosphere/storm:exclamation .
docker build --no-cache -t=mesosphere/storm:exclamation .
