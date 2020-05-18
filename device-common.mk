#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from common
$(call inherit-product, device/samsung/msm8916-common/msm8916.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/a3-common/a3-common-vendor.mk)

LOCAL_PATH := device/samsung/a3-common

# Common overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Platform info config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.video=true \
    av.streaming.offload.enable=true \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.pcm.24bit.enable=true \
    ro.dualmic=true

# Camera
PRODUCT_PACKAGES += \
    Snap

# FlipFlap
PRODUCT_PACKAGES += \
    FlipFlap

# Media configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

ifneq ($(TARGET_DEVICE),a33g)
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# NFC packages
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service \
    libnfc_nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc.helper \
    com.android.nfc_extras

# NFC configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Ramdisk
PRODUCT_PACKAGES += \
	init.target.rc

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.rat_on=combine \
    ro.ril.transmitpower=true \
    persist.radio.no_wait_for_card=1 \
    persist.radio.use_se_table_only=1

PRODUCT_PACKAGES += \
    libril \
    librilutils \
    rild

# append the updater uri to the product properties if set
ifneq ($(CM_UPDATER_OTA_URI),)
	PRODUCT_PROPERTY_OVERRIDES += $(CM_UPDATER_OTA_URI)
endif

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
