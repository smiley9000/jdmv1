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


# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Audio
PRODUCT_PACKAGES += \
    MtkInCallService

# Biometrics
PRODUCT_PACKAGES += \
    $(DEVICE_PATH)/init/init.face_service.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.face_service.rc 

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
    $(DEVICE_PATH)/init/init-sec_ril.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init-sec_ril.rc \
    $(DEVICE_PATH)/secril/bin/secril_config_svc.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/bin/secril_config_svc.so \
    $(DEVICE_PATH)/secril/bin/hw/mtkfusionrild.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/bin/hw/mtkfusionrild.so \
    $(DEVICE_PATH)/secril/bin/hw/rild.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/bin/hw/rild.so \
    $(DEVICE_PATH)/secril/lib64/android.hardware.radio.config@1.3.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/android.hardware.radio.config@1.3.so \
    $(DEVICE_PATH)/secril/lib64/android.hardware.radio@1.6.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/android.hardware.radio@1.6.so \
    $(DEVICE_PATH)/secril/lib64/libcarrierconfig.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libcarrierconfig.so \
    $(DEVICE_PATH)/secril/lib64/libmtkconfig.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtkconfig.so \
    $(DEVICE_PATH)/secril/lib64/libmtkconfigutils.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtkconfigutils.so \
    $(DEVICE_PATH)/secril/lib64/libmtk-fusion-ril-prop-vsim.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtk-fusion-ril-prop-vsim.so \
    $(DEVICE_PATH)/secril/lib64/libmtkmipc-ril.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtkmipc-ril.so \
    $(DEVICE_PATH)/secril/lib64/libmtknetcap.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtknetcap.so \
    $(DEVICE_PATH)/secril/lib64/libmtk-ril.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtk-ril.so \
    $(DEVICE_PATH)/secril/lib64/libmtkrilutils.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libmtkrilutils.so \
    $(DEVICE_PATH)/secril/lib64/libril_sem.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libril_sem.so \
    $(DEVICE_PATH)/secril/lib64/librilfusion.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/librilfusion.so \
    $(DEVICE_PATH)/secril/lib64/libsec-ril.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libsec-ril.so \
    $(DEVICE_PATH)/secril/lib64/libsecril-client.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libsecril-client.so \
    $(DEVICE_PATH)/secril/lib64/libSemTelephonyProps.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libSemTelephonyProps.so \
    $(DEVICE_PATH)/secril/lib64/libviamipc-ril.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libviamipc-ril.so \
    $(DEVICE_PATH)/secril/lib64/libvia-ril.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/libvia-ril.so \
    $(DEVICE_PATH)/secril/lib64/vendor.mediatek.hardware.mtkradioex@3.0.so:$(TARGET_COPY_OUT_SYSTEM)/etc/secril/lib64/vendor.mediatek.hardware.mtkradioex@3.0.so 

# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# Inherit the proprietary files
# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/samsung_ext


