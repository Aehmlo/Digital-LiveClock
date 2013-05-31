export TARGET=iphone:5.0:5.0
include theos/makefiles/common.mk

TWEAK_NAME = DigitalLiveClock
DigitalLiveClock_FILES = Tweak.xm
DigitalLiveClock_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
