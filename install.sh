#!/usr/bin/env bash

PACKAGE_NAME="uulm"

function copy_files() {
	for type in cls pdf; do
		for f in *.${type}; do
			echo " * $f"
			cp $f $1
		done
	done
}

if [ "$1" == "" ]; then
	echo "Usage: $0 <install-path>"
	echo "Suitable paths seem to be:"
	kpsepath tex |tr : "\n" |egrep "$HOME.*/tex///" |
		sed 's/\/\///' |
		sed 's/^/ * /'
	exit 1
fi

DIR=$1

CORRECT=0
kpsepath tex | grep $DIR >/dev/null && CORRECT=1

if [ "$CORRECT" -eq "0" ]; then
	echo "$DIR is not a correct install path."
	exit 2
fi

if [ -d "$DIR/latex/$PACKAGE_NAME" ]; then
	echo "Old version found. Replacing files:"
	copy_files $DIR/latex/$PACKAGE_NAME
else
	echo "Initial installation. Copying files:"
	mkdir -p $DIR/latex/$PACKAGE_NAME
	copy_files $DIR/latex/$PACKAGE_NAME
fi

echo "Testing installation:"

OLDPWD="$PWD"
for cls in *.cls; do
	cd /
	kpsewhich $cls || echo $cls ... NOT FOUND
done
cd $OLDPWD
