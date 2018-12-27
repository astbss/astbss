#!/bin/sh
set -e
# set -e stops the execution of a script if a command or pipeline has an error

# /etc/ibixtables/ibixtables-docker

# https://success.docker.com/article/use-a-script-to-initialize-stateful-container-data
# https://www.voip-info.org/asterisk-options/
# -f: Stay in foreground mode
# -g: Dump core in case of a crash
# -v: The verbose command. Add more ‘v’:s to get more messages.

# -cpuset-cpus="0,1" may be better than nice
# https://docs.docker.com/config/containers/resource_constraints/#understand-the-risks-of-running-out-of-memory
# Using --cap-add=SYS_NICE worked

# https://github.com/docker-library/php

# exec "nice -n 0 /usr/sbin/asterisk -f vvv"
exec "/usr/sbin/asterisk -f vvv"

# exec "$@"
