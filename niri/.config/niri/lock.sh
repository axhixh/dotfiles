#!/bin/sh

# lock screen
qs -c noctalia-shell ipc call lockScreen lock

# in theory we could run ipc call to check
# state in a while loop
sleep 1

