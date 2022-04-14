ORIGINAL=debian-11.3.0-amd64-netinst.iso
TARGET=debian-11.3.0-amd64-netinst_custom.iso

.PHONY: $TARGET upload

$TARGET: iso/preseed.cfg iso/isolinux/auto.cfg iso/isolinux/isolinux.cfg iso/isolinux/menu.cfg
	mkisofs -o ${TARGET} -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V "Debian 11.3 Custom Imstaller" ./iso

iso/isolinux/menu.cfg: iso isolinux/menu.cfg
	cp isolinux/menu.cfg iso/isolinux/menu.cfg

iso/isolinux/isolinux.cfg: iso isolinux/isolinux.cfg
	cp isolinux/isolinux.cfg iso/isolinux/isolinux.cfg

iso/isolinux/auto.cfg: iso isolinux/auto.cfg
	cp isolinux/auto.cfg iso/isolinux/auto.cfg

iso/preseed.cfg: iso preseed.cfg
	cp preseed.cfg iso/preseed.cfg

iso:
	mkdir iso
	cd iso; 7z x ../${ORIGINAL}
