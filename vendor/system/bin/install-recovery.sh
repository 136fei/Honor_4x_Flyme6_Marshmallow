#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11714560 e3a3e6e56f04b59523ececf8ddf6440af8529091 9340928 e1e853a1b1be9c5ba35f3b0e9e32575bfa8d563a
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:11714560:e3a3e6e56f04b59523ececf8ddf6440af8529091; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:9340928:e1e853a1b1be9c5ba35f3b0e9e32575bfa8d563a EMMC:/dev/block/bootdevice/by-name/recovery e3a3e6e56f04b59523ececf8ddf6440af8529091 11714560 e1e853a1b1be9c5ba35f3b0e9e32575bfa8d563a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
