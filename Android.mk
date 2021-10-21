LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a71)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
