ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:8.1:7.0

include theos/makefiles/common.mk

TWEAK_NAME = iMessageSpamReporter
iMessageSpamReporter_FILES = Tweak.x
iMessageSpamReporter_FRAMEWORKS = UIKit MessageUI
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileSMS"
