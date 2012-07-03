# dbskkd-cdb Makefile

CC = cc -Wall -O2 -g -I/usr/local/include -I/opt/local/include
COMPAT =
CDBLIB = /opt/local/lib/libcdb.a
INSTALLDIR = $(HOME)/bin
JISYOCDB = SKK-JISYO.ALL.cdb
JISYOFILE = $(HOME)/Dropbox/ddskk/$(JISYOCDB)

.c.o:
	$(CC) $(COMPAT) $(PRIVATE) -c $*.c

all: 	dbskkd-cdb create-cdb create-tcprule

clean:
	/bin/rm -f dbskkd-cdb *.o SKK-JISYO.ALL *.cdb

create-cdb:
	/bin/sh makeskkcdb.sh

create-tcprule:
	tcprules tcprules.cdb tcp.dbskkd.tmp < tcp.dbskkd

dbskkd-cdb: dbskkd-cdb.o 
	$(CC) $(COMPAT) $(PRIVATE) -o dbskkd-cdb \
		dbskkd-cdb.o ${CDBLIB}

dbskkd-cdb.o: dbskkd-cdb.c
	$(CC) $(COMPAT) $(PRIVATE) -DJISYO_FILE=\"$(JISYOFILE)\" -c dbskkd-cdb.c

error.o: error.c error.h

install: dbskkd-cdb
	cp dbskkd-cdb $(INSTALLDIR); chmod 755 $(INSTALLDIR)/dbskkd-cdb; \
	cp tcprules.cdb $(HOME)/etc; \
	cp $(JISYOCDB) $(JISYOFILE); \
	cp dbskkd-cdb-tcp.sh $(HOME)/bin; chmod 755 $(HOME)/bin/dbskkd-cdb-tcp.sh

# end of makefile
