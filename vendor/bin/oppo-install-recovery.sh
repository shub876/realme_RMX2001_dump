#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:6f01e2b34bfddebbef686cf7bca83cedc1309415; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:a1950ae8a0ab827b52584d916aab9f7efe16115b \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:6f01e2b34bfddebbef686cf7bca83cedc1309415 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
