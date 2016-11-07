#!/bin/sh

. /etc/script/lib/command.sh

PID_FILE=/var/run/duplicati-server.pid

MONO_CMD=/usr/local/bin/mono

case $1 in

	start)
		# start script here
		cd $APKG_PKG_DIR/
		$MONO_CMD Duplicati.Server.exe --webservice-port=8201 --webservice-interface=* --log-retention=30D --server-datafolder=$APKG_PKG_DIR/config --tempdir=$APKG_PKG_DIR/tmp > /dev/null &
		echo $! > $PID_FILE
		;;

	stop)
		# stop script here
		kill -9 `cat $PID_FILE` 2> /dev/null
		rm -rf $PID_FILE
		;;

	*)
		echo "usage: $0 {start|stop}"
		exit 1
		;;
		
esac

exit 0
