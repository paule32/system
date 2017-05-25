#!/bin/sh

cd live_boot/initrd
find . | cpio --create --format='newc' > ../newinitrd
cd ..
gzip -9 newinitrd
cp newinitrd.gz ./image/live/initrd1
rm -rf newinitrd.gz
rm -rf ./image/live/filesystem.squashfs

#-------------------

mksquashfs ./image ./image/live/filesystem.squashfs -e boot
#cd image
genisoimage -rational-rock -volid "DVE - Software" \
	-cache-inodes \
	-joliet \
	-full-iso9660-filenames \
	-b isolinux/isolinux.bin \
	-c isolinux/boot.cat \
	-no-emul-boot \
	-boot-load-size 4 \
	-boot-info-table \
	-output ../dvecafe.iso ./image
