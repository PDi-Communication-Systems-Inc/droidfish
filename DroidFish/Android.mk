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
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4 \
                               junit \
			       jsr305

# Give package a simple name
LOCAL_PACKAGE_NAME := droidfish

# not a critical package
LOCAL_MODULE_TAGS := optional

# ensure signing with PDi key for distribution release
LOCAL_CERTIFICATE := platform

# bring in the resources
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_AAPT_FLAGS := --auto-add-overlay --generate-dependencies

LOCAL_SDK_VERSION := current

LOCAL_PROGUARD_ENABLED := disabled

# tell build system to put the package together
include $(BUILD_PACKAGE)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := junit:libs/junit-4.12.jar

include  $(BUILD_MULTI_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE    := libnativeutil
LOCAL_SRC_FILES := jni/nativeutil.cpp

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE    := libgtb
LOCAL_SRC_FILES := \
	jni/gtb/gtb-probe.c jni/gtb/gtb-dec.c jni/gtb/gtb-att.c jni/gtb/sysport/sysport.c jni/gtb/compression/wrap.c \
	jni/gtb/compression/huffman/hzip.c jni/gtb/compression/lzma/LzmaEnc.c jni/gtb/compression/lzma/LzmaDec.c \
	jni/gtb/compression/lzma/Alloc.c jni/gtb/compression/lzma/LzFind.c jni/gtb/compression/lzma/Lzma86Enc.c \
	jni/gtb/compression/lzma/Lzma86Dec.c jni/gtb/compression/lzma/Bra86.c jni/gtb/compression/zlib/zcompress.c \
	jni/gtb/compression/zlib/uncompr.c jni/gtb/compression/zlib/inflate.c jni/gtb/compression/zlib/deflate.c \
	jni/gtb/compression/zlib/adler32.c jni/gtb/compression/zlib/crc32.c jni/gtb/compression/zlib/infback.c \
	jni/gtb/compression/zlib/inffast.c jni/gtb/compression/zlib/inftrees.c jni/gtb/compression/zlib/trees.c \
	jni/gtb/compression/zlib/zutil.c jni/gtb/compression/liblzf/lzf_c.c jni/gtb/compression/liblzf/lzf_d.c \
	jni/gtb/GtbProbe.cpp

include external/stlport/libstlport.mk
LOCAL_SHARED_LIBRARIES := libstlport

LOCAL_CFLAGS    := \
	-I $(LOCAL_PATH)/jni/gtb/sysport/ -I $(LOCAL_PATH)/jni/gtb/compression/ \
	-I $(LOCAL_PATH)/jni/gtb/compression/liblzf/ -I $(LOCAL_PATH)/jni/gtb/compression/zlib/ \
	-I $(LOCAL_PATH)/jni/gtb/compression/lzma/ -I $(LOCAL_PATH)/jni/gtb/compression/huffman/ \
	-D Z_PREFIX -D NDEBUG -Wall\
	 -mandroid -DTARGET_OS=android -D__ANDROID__

include $(BUILD_SHARED_LIBRARY)

#include $(CLEAR_VARS)

#LOCAL_MODULE    := librtb
#LOCAL_SRC_FILES := \
	jni/rtb/bitBoard.cpp jni/rtb/material.cpp jni/rtb/moveGen.cpp jni/rtb/position.cpp jni/rtb/rtb-probe.cpp jni/rtb/tbprobe.cpp \
	jni/rtb/RtbProbe.cpp

#include external/libcxx/libcxx.mk
#LOCAL_CFLAGS    := --std=c++11 \
	-I $(LOCAL_PATH)/jni/rtb/sysport/ -I -DNDEBUG -Wall \
	 -mandroid -DTARGET_OS=android -D__ANDROID__ \
	-D__STDC_INT64__ -D_GLIBCXX_USE_C99_STDINT_TR1 \
	-D_GLIBCXX_HAS_GTHREADS -D_GLIBCXX__PTHREADS

#include $(BUILD_SHARED_LIBRARY)
