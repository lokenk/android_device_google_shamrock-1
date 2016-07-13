LOCAL_PATH := $(call my-dir)
MKELF := device/google/shamrock/tools/mkelf.py
DEVICE_KERNEL := device/google/shamrock
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(DEVICE_KERNEL)/kernel $(INSTALLED_RAMDISK_TARGET) $(MKBOOTIMG) $(MINIGZIP) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Boot image: $@")
	$(hide) python $(MKELF) -o $@ $(DEVICE_KERNEL)/kernel $(PRODUCT_OUT)/ramdisk.img
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	$(call pretty,"Recovery image: $@")
	$(hide) python $(MKELF) -o $@ $(DEVICE_KERNEL)/kernel $(PRODUCT_OUT)/ramdisk-recovery.img,ramdisk
#	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
