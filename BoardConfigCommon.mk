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

LOCAL_PATH := device/samsung/a3-common

# Audio
USE_CUSTOM_MIXER_PATHS := true
USE_CUSTOM_AUDIO_PLATFORM_INFO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Keymaster
TARGET_PROVIDES_LIBLIGHT := true

# RIL
BOARD_MODEM_TYPE := xmm7260
BOARD_PROVIDES_LIBRIL := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Include
TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Init
TARGET_LIBINIT_MSM8916_DEFINES_FILE := $(LOCAL_PATH)/init/init_a3.cpp

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true

# inherit from qcom-common
include device/samsung/msm8916-common/BoardConfigCommon.mk
