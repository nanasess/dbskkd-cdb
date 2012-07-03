#!/bin/sh
cat ../skk/dic/SKK-JISYO.* > SKK-JISYO.ALL
./skktocdbm.sh < ./SKK-JISYO.ALL | \
	cdb -c -t - SKK-JISYO.ALL.cdb
