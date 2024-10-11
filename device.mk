#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
DEVICE_PATH := device/samsung/a05m

$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_FULL_TREBLE_OVERRIDE := true

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Audio
PRODUCT_PACKAGES += \
    MtkInCallService

# Biometrics
PRODUCT_PACKAGES += \
#    $(DEVICE_PATH)/init/init.face_service.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.face_service.rc 

# Bluetooth
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Charger
PRODUCT_PACKAGES += \
    charger_res_images_vendor \
    $(DEVICE_PATH)/init/init.sec-charger.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.sec-charger.rc \
    libsuspend

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

PRODUCT_PACKAGES += \
    fastbootd

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhardware \
    libhwbinder

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigOverlay_JDM_A05 \
    FrameworksResOverlay_JDM_A05 \
    SystemUIOverlay_JDM_A05 \
    TelephonyOverlay_JDM_A05\
    WifiResOverlay_JDM_A05

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *

# Power Off Alarm
PRODUCT_PACKAGES += \
    PowerOffAlarm

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6768 \
    fstab.mt6768.ramdisk \
    init.cgroup.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6768.rc \
    init.mt6768.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.target.rc \
    ueventd.mt6768.rc

PRODUCT_PACKAGES += \
    init.recovery.mt6768.rc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# SEC_RIL
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/vendor_overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/31/)


# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# Inherit the proprietary files

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/samsung_ext 

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a05m/a05m-vendor.mk)
