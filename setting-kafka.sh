#!/bin/bash

cd $HOME
# Install java 8 
sudo apt-get update
sudo apt-get wget, openjdk-8-jdk

# Download kafka 2.8.0
wget https://mirror.navercorp.com/apache/
if [ ! -f kafka_2.12-2.8.0/bin/kafka-topic.sh]; then
	echo "Can't find kafka-2.8.0"
	exit
fi

# Add kafka .sh path
echo "export PATH=${HOME}/kafka_2.12-2.8.0/bin:\$PATH" >> ~/.bashrc
exec bash
	
# Setting zookeeper directory
# Kafka's default zookeeper data directory is /tmp/zookeeper
# Snapshot is stored.
# dataDir=path
mkdir -p ${HOME}/kafka_2.12-2.8.0/data/zookeeper 
sed -i  "s|\/tmp\/zookeeper|${HOME}/kafka_2.12-2.8.0\/data\/zookeeper|g" ${HOME}/kafka_2.12-2.8.0/config/zookeeper.properties
# Setting kafka log
# kafka's default store log file directory is /tmp/kafka-logs
# Comma(,) separated list of directory
# log.dirs=path
mkdir -p ${HOME}/kafka_2.12-2.8.0/data/kafka
sed -i "s|\/tmp\/kafka-logs|${HOME}/kafka_2.12-2.8.0\/data\/kafka|g" ${HOME}/kafka_2.12-2.8.0/config/server.properties

# Remove kafka archive
rm $HOME/kafka_2.12-2.8.0.tgz


