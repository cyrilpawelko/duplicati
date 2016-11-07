#!/bin/sh
case "$APKG_PKG_STATUS" in
	install)
		# pre install script here
		;;
	upgrade)
		# pre upgrade script here (backup data)
                cp -arf $APKG_PKG_DIR/config/* $APKG_TEMP_DIR/ 2>&1 
		;;
	*)
		;;

esac

exit 0
