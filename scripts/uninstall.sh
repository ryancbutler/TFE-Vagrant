#!/bin/bash
# Systemd
systemctl stop replicated replicated-ui replicated-operator
systemctl disable replicated replicated-ui replicated-operator
docker stop $(docker ps -a -q)
docker rm -f replicated replicated-ui replicated-operator replicated-premkit replicated-statsd retraced-api retraced-processor retraced-cron retraced-nsqd retraced-postgres
rm -rf /etc/default/replicated* /etc/init.d/replicated* /etc/init/replicated* /etc/replicated* /etc/sysconfig/replicated* /etc/systemd/system/multi-user.target.wants/replicated* /etc/systemd/system/replicated* /run/replicated* /usr/local/bin/replicated* /var/lib/replicated* /var/log/upstart/replicated*
# Optionally, run systemd daemon-reload
systemctl daemon-reload
# Remove the images.
docker system prune --all --volumes -f