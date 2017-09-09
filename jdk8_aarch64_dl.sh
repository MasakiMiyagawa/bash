#!/bin/sh
# This script downloads all jdk8 package of AArch64 Port Project.

ZIP="tip.zip"

download_zip() {
	PDIR=$1
	DIR=$2
	ARCHIVE=$3
	wget http://hg.openjdk.java.net/aarch64-port/${PDIR}/${DIR}/archive/${ARCHIVE}
	unzip ${ARCHIVE}
	mv ${DIR}* ${DIR}
	rm ${ARCHIVE}
}

for i in "corba" "hotspot" "jaxp" "jaxws" "jdk" "langtools" "nashorn"; do
	echo "Downloading $i"
	download_zip "jdk8" $i ${ZIP}
done

echo "Downloading jdk8"
download_zip "" "jdk8" ${ZIP}

for i in "corba" "hotspot" "jaxp" "jaxws" "jdk" "langtools" "nashorn"; do
	mv $i jdk8
done
