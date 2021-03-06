ifeq ($(strip $(BOARD_USES_EXTN_AUDIO_POLICY_MANAGER)),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := AudioPolicyManager.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    liblog

LOCAL_STATIC_LIBRARIES := \
    libmedia_helper

LOCAL_WHOLE_STATIC_LIBRARIES := \
    libaudiopolicy_legacy

LOCAL_MODULE := audio_policy.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_FM)),true)
LOCAL_CFLAGS += -DAUDIO_EXTN_FM_ENABLED
endif
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_PROXY_DEVICE)),true)
LOCAL_CFLAGS += -DAUDIO_EXTN_AFE_PROXY_ENABLED
endif
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_INCALL_MUSIC)),true)
LOCAL_CFLAGS += -DAUDIO_EXTN_INCALL_MUSIC_ENABLED
endif
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_HDMI_SPK)),true)
LOCAL_CFLAGS += -DAUDIO_EXTN_HDMI_SPK_ENABLED
endif


ifeq ($(strip $(TARGET_BOARD_PLATFORM)),msm8916)
LOCAL_CFLAGS += -DVOICE_CONCURRENCY
LOCAL_CFLAGS += -DWFD_CONCURRENCY
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL)), true)
LOCAL_CFLAGS += -DMULTIPLE_OFFLOAD_ENABLED
endif

include $(BUILD_SHARED_LIBRARY)

endif
