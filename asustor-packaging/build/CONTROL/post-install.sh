#!/bin/sh

MONO_CMD=/usr/local/bin/mono

case "$APKG_PKG_STATUS" in

	install)
		# post install script here
                cd $APKG_PKG_DIR/
                $MONO_CMD mozroots.exe --import --sync --url "http://hg.mozilla.org/releases/mozilla-release/raw-file/default/security/nss/lib/ckfw/builtins/certdata.txt" > /dev/null 
		;;
	upgrade)
		# post upgrade script here (restore data)
		cp -arf $APKG_TEMP_DIR/* $APKG_PKG_DIR/config/ 
		;;
	*)
		;;

esac

exit 0
