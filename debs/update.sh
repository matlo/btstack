#/bin/sh
dpkg-scanpackages . overridefile > Packages
rm -f Packages.bz2
bzip2 -k Packages
P1_MD5=`md5sum Packages | cut -d " " -f 1`
P1_SIZE=`ls -l Packages | cut -d " " -f 8`
P2_MD5=`md5sum Packages.bz2 | cut -d " " -f 1`
P2_SIZE=`ls -l Packages.bz2 | cut -d " " -f 8`
rm Release
cp Release.in Release
echo " $P1_MD5 $P1_SIZE Packages" >> Release
echo " $P2_MD5 $P2_SIZE Packages.bz2" >> Release
