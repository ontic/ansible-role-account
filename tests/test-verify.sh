#!/bin/bash
# Copyright (c) Ontic. (http://www.ontic.com.au). All rights reserved.
# See the COPYING file bundled with this package for license details.

# Verify the group exists.
docker exec --tty ${container_id} env TERM=xterm awk -v val=1333 -F ":" '$3==val{print "Group: "$1" (1333)"}' /etc/group
# Verify the user exists.
docker exec --tty ${container_id} env TERM=xterm awk -v val=1444 -F ":" '$3==val{print "User: "$1" (1444)"}' /etc/passwd