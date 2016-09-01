#!/bin/bash

set -o errexit -o nounset
MESOS_MASTER_ZK="${MESOS_MASTER_ZK:-master.mesos}"

echo "Running storm with MESOS_MASTER_ZK=${MESOS_MASTER_ZK}"
 

echo "nimbus.port: $PORT1"
echo "ui.port: $PORT0"

function run_ui () {
  while [ true ] ; do
    ./bin/storm ui -c ui.port=$PORT0 -c nimbus.thrift.port=$PORT1 -c storm.log.dir=$MESOS_SANDBOX/logs ${STORM_UI_OPTS:-}
  done
}

function run_nimbus () {
  ./bin/storm-mesos nimbus -c nimbus.thrift.port=$PORT1  -c storm.log.dir=$MESOS_SANDBOX/logs  ${STORM_NIMBUS_OPTS:-}
}

function run_topology () {
  sleep 50
  ./bin/storm jar -c nimbus.host=slave -c nimbus.thrift.port=$PORT1 -c topology.worker.log.dir=$MESOS_SANDBOX/worker-logs/  exclamation.jar jvm.storm.exclamation.ExclamationTopology exclamation

}

function run () {
  run_ui &
  run_topology &
  run_nimbus 
}
#-c mesos.master.url=zk://${MESOS_MASTER_ZK}:2181/mesos -c storm.zookeeper.servers="[\"${MESOS_MASTER_ZK}\"]"
run
