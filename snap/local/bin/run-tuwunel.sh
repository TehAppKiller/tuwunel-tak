#!/bin/bash -e

# Check configuration file
if [ ! -f $SNAP_DATA/etc/tuwunel/tuwunel.toml ]; then
    echo "! Configuration file does not exist !"
	echo "Making configuration directory..."
	mkdir -p $SNAP_DATA/etc/tuwunel
	echo "Copying original configuration file..."
	cp $SNAP/etc/tuwunel/tuwunel.toml $SNAP_DATA/etc/tuwunel/
	echo "Configuration file initialized."
fi

# Launch app
echo "Launching app..."
$SNAP/usr/sbin/tuwunel
