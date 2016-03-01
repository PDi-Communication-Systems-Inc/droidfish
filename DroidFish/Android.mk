# Location of source files in the development tree
# which is the directory of this file
LOCAL_PATH := $(call my-dir)

# clear LOCAL_ variables except LOCAL_PATH
include $(CLEAR_VARS)

# name of the package to build
LOCAL_PACKAGE := droidfish

# Specify java files to use in build
LOCAL_SRC_FILES := $(call all-java-files-under)
LOCAL_SRC_FILES += $(call all-java-files-under,../CuckooChess)
LOCAL_SRC_FILES += $(call all-java-files-under,../CuckooChessAPK)
LOCAL_SRC_FILES += $(call all-java-files-under,../CuckooChessEngine)
LOCAL_SRC_FILES += $(call all-java-files-under,../CuckooChessEngineTest)
LOCAL_SRC_FILES += $(call all-java-files-under,../DroidFishTest)

# Java support libraries
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4 junit-4.12.jar

# Give package a simple name
LOCAL_PACKAGE_NAME := droidfish

# not a critical package
LOCAL_MODULE_TAGS := optional

# ensure signing with PDi key for distribution release
LOCAL_CERTIFICATE := platform

# tell build system to put the package together
include $(BUILD_PACKAGE)
