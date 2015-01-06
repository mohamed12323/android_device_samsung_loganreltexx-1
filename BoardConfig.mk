# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common msm8930
-include device/samsung/msm8930-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/loganreltexx/include

# Kernel
BOARD_KERNEL_CMDLINE         := androidboot.hardware=qcom androidboot.selinux=permissive user_debug=23 zcache androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE            := 0x80200000
BOARD_MKBOOTIMG_ARGS         := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE        := 2048
TARGET_KERNEL_SOURCE         := kernel/samsung/msm8930-common
TARGET_KERNEL_CONFIG         := cyanogen_loganre_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8930_loganre_eur_lte_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig

TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Assert
TARGET_OTA_ASSERT_DEVICE := loganreltexx,loganrelte,GT-S7275R,GT-S7275B,GT-S7275T

# Recovery
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_FSTAB := device/samsung/loganreltexx/rootdir/fstab.qcom
TARGET_RECOVERY_INITRC := device/samsung/loganreltexx/rootdir/init.recovery.rc
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/lcd/panel/backlight\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1698693120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5693750272
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5821676544
BOARD_FLASH_BLOCK_SIZE := 131072

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/loganreltexx/bluetooth

# NFC
BOARD_HAVE_NFC := true
BOARD_NFC_CHIPSET := pn547

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Use seperate speakerphone device
BOARD_USES_SEPERATED_VOICE_SPEAKER := true

# Use seperate devices for VOIP
BOARD_USES_SEPERATED_VOIP := true

# Use USB Dock Audio
BOARD_HAVE_DOCK_USBAUDIO := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable QCOM FM feature
AUDIO_FEATURE_ENABLED_FM := true
QCOM_FM_ENABLED := true
BOARD_USES_SEPERATED_FM := true

# No required to load FM firmware
TARGET_QCOM_NO_FM_FIRMWARE := false

# Camera
TARGET_NEED_DISABLE_AUTOFOCUS := true
TARGET_NEED_DISABLE_FACE_DETECTION := true
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true
TARGET_VIDEO_PREVIEW_ALWAYS_MAX := true

# PowerHAL
TARGET_POWERHAL_VARIANT := 

# Custom RIL class
BOARD_RIL_CLASS := ../../../device/samsung/loganreltexx/ril/

# SELinux
include device/qcom/sepolicy/sepolicy.mk
