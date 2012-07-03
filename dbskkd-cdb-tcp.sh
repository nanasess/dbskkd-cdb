#!/bin/sh
exec 2>&1
exec tcpserver -x $HOME/etc/tcprules.cdb \
-vDRH -l localhost 127.0.0.1 1178 \
$HOME/bin/dbskkd-cdb
