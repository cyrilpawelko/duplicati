#!/bin/sh
# See http://developer.asustor.com for Asustor Packaging documentation
# Requires apkg-tools.py from "APKG_Utilities_2.0" http://developer.asustor.com/document/APKG_Utilities_2.0.zip

# TODO : Go to build directory
mkdir build
cd build

# TODO: Copy CONTROL directory with the following files: changelog.txt  config.json  description.txt  icon.png  post-install.sh  post-uninstall.sh  pre-install.sh  pre-uninstall.sh  start-stop.sh

# TODO : complete email and maintainer in config.json
# Update config.json. Specify at least v1.1.1 since I already submitted this version to asustor
sed -i s/__VERSION__/1.1.1/ CONTROL/config.json
 
# Make sure config directory exists (even if empty), or configuration will be lost during upgrades
if [ ! -d config ]; then mkdir config; fi

# Make sure tmp directory exists
if [ ! -d tmp ]; then mkdir tmp; fi

# Retrieve compiled zip version from https://www.duplicati.com/download ("Zip file")
# TODO : Download zip version
unzip duplicati-*.zip
rm duplicati-*.zip

# Populate changelog
# TODO : Populate Changelog

# Build Package
# TODO : Download apkg-tools.py
cd ..
apkg-tools.py create build

# Package duplicati-VERSION-any.apk will be build in this directory
