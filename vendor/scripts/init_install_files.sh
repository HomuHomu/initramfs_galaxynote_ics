#!/sbin/busybox sh

/sbin/busybox mount -o remount,rw /system /system

##### Install SU #####

if [ -f /system/xbin/su ] || [ -f /system/bin/su ];
then
	echo "su already exists"
else
	echo "Copying su binary"
	/sbin/busybox rm /system/bin/su
	/sbin/busybox rm /system/xbin/su
	/sbin/busybox cp /vendor/files/su /system/xbin/su
	/sbin/busybox chown 0.0 /system/xbin/su
	/sbin/busybox chmod 6755 /system/xbin/su
fi

# BLN
/sbin/busybox rm /system/lib/hw/lights.exynos4.so
/sbin/busybox cp /vendor/files/lights.exynos4.so /system/lib/hw/lights.exynos4.so
/sbin/busybox chown 0.0 /system/lib/hw/lights.exynos4.so
/sbin/busybox chmod 644 /system/lib/hw/lights.exynos4.so

/sbin/busybox mount -o remount,ro /system /system

