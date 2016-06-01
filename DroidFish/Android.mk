# Location of source files in the development tree
# which is the directory of this file
LOCAL_PATH := $(call my-dir)

# clear LOCAL_ variables except LOCAL_PATH
include $(CLEAR_VARS)

# name of the package to build
LOCAL_PACKAGE := droidfish

# Specify java files to use in build
LOCAL_SRC_FILES := $(call all-java-files-under)
LOCAL_SRC_FILES += $(call all-java-files-under,../CuckooChessEngine)
LOCAL_SRC_FILES += $(call all-java-files-under,../CuckooChessEngineTest)
LOCAL_SRC_FILES += $(call all-java-files-under,../DroidFishTest)

# Java support libraries
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4 junit-4.12

# Give package a simple name
LOCAL_PACKAGE_NAME := droidfish

# not a critical package
LOCAL_MODULE_TAGS := optional

# ensure signing with PDi key for distribution release
LOCAL_CERTIFICATE := platform

# bring in the resources
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_AAPT_FLAGS := --auto-add-overlay --generate-dependencies

# tell build system to put the package together
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := junit-4.12:libs/junit-4.12.jar \
					android-support-v4:libs/android-support-v4.jar

include  $(BUILD_MULTI_PREBUILT)
