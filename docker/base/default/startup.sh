#!/bin/bash

if [ -x /usr/bin/app.sh ]
  then
  /usr/bin/app.sh
fi

/usr/sbin/sshd -D
