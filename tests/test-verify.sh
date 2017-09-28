#!/bin/bash

# Verify the user and group exists.
docker exec --tty ${container_id} env TERM=xterm getent group administrator