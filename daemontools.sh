#!/bin/sh
exec 2>&1
exec tcpserver -x ./tcprules.cdb \
-vDRH -l localhost 127.0.0.1 1178 \
$HOME/bin/dbskkd-cdb
#
# this is an example run file 
# for daemontools service directory.
# note that dbskkd-cdb must be invoked
# with a non-privileged dedicated user account.
#
