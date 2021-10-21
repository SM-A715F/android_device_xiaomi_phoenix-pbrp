#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Release name
PRODUCT_RELEASE_NAME := a71
DEVICE_PATH := device/samsung/a71

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit 64bit support35
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) \
    $(LOCAL_PATH)/prebuilt/dtb:dtb.img

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a71
PRODUCT_NAME := omni_a71
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Galaxy
PRODUCT_MANUFACTURER := Samsung
PRODUCT_USE_DYNAMIC_PARTITIONS := true
# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.device \
    ro.product.name \
    ro.build.product \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

