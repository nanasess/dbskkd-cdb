#!/bin/sh
cat  ../skk/dic/SKK-JISYO.*  ../skk/dic/zipcode/SKK-JISYO.* > SKK-JISYO.ALL.tmp
../skk/tools/skkdic-expr2 SKK-JISYO.ALL.tmp | ../skk/tools/skkdic-sort > SKK-JISYO.ALL
./skktocdbm.sh < ./SKK-JISYO.ALL | \
	cdb -c -t - SKK-JISYO.ALL.cdb
