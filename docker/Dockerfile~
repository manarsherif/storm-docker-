FROM mesosphere/storm:0.1.5-SNAPSHOT-0.10.1-0.28.2-jdk8

ADD configure-storm.sh ./bin/configure-storm.sh
ADD exclamation.jar .

RUN chmod +x ./bin/configure-storm.sh

RUN rm -f conf/storm.yaml
ADD storm.yaml conf/storm.yaml

# Run Commands that will execute when container runs

CMD ./bin/configure-storm.sh
