#
# Copyright (C) 2023-2024 EpicROM-AOSP
#
# SPDX-License-Identifier: Apache-2.0
#

EPIC_DATE_YEAR := $(shell date -u +%Y)
EPIC_DATE_MONTH := $(shell date -u +%m)
EPIC_DATE_DAY := $(shell date -u +%d)
EPIC_DATE_HOUR := $(shell date -u +%H)
EPIC_DATE_MINUTE := $(shell date -u +%M)
EPIC_BUILD_DATE_UTC := $(shell date -d '$(EPIC_DATE_YEAR)-$(EPIC_DATE_MONTH)-$(EPIC_DATE_DAY) $(EPIC_DATE_HOUR):$(EPIC_DATE_MINUTE) UTC' +%s)
EPIC_BUILD_DATE := $(EPIC_DATE_YEAR)$(EPIC_DATE_MONTH)$(EPIC_DATE_DAY)-$(EPIC_DATE_HOUR)$(EPIC_DATE_MINUTE)

EPIC_PLATFORM_VERSION := 14.0
EPIC_CODENAME := Testing
EPIC_BUILD_VERSION := v24.4.5

MAINTAINER_LIST = $(shell cat epic-maintainers/maintainers.list)
DEVICE_LIST = $(shell cat epic-maintainers/devices.list)

ifeq ($(filter $(EPIC_BUILD), $(DEVICE_LIST)), $(EPIC_BUILD))
   ifeq ($(filter $(EPIC_MAINTAINER), $(MAINTAINER_LIST)), $(EPIC_MAINTAINER))
      EPIC_BUILD_TYPE := OFFICIAL
  else
     # the builder is overriding official flag on purpose
     ifeq ($(EPIC_BUILD_TYPE), OFFICIAL)
       $(error **********************************************************)
       $(error *     A violation has been detected, aborting build      *)
       $(error **********************************************************)
       EPIC_BUILD_TYPE := COMMUNITY
     else
       $(warning **********************************************************************)
       $(warning *   There is already an official maintainer for $(EPIC_BUILD)    *)
       $(warning *              Setting build type to COMMUNITY                      *)
       $(warning *    Please contact current official maintainer before distributing  *)
       $(warning *              the current build to the community.                   *)
       $(warning **********************************************************************)
       EPIC_BUILD_TYPE := COMMUNITY
     endif
  endif
else
   ifeq ($(EPIC_BUILD_TYPE), OFFICIAL)
     $(error **********************************************************)
     $(error *     A violation has been detected, aborting build      *)
     $(error **********************************************************)
   endif
  EPIC_BUILD_TYPE := COMMUNITY
endif

ifdef EPIC_MAINTAINER
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.epic.maintainer=$(EPIC_MAINTAINER)
endif

EPIC_VERSION := EpicROM-$(EPIC_BUILD_VERSION)-$(EPIC_CODENAME)-$(CUSTOM_BUILD)-$(EPIC_PLATFORM_VERSION)-$(EPIC_BUILD_TYPE)-$(EPIC_BUILD_DATE)

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.epic.codename=$(EPIC_CODENAME) \
    ro.epic.build.date=$(EPIC_BUILD_DATE) \
    ro.epic.build_type=$(EPIC_BUILD_TYPE) \
    ro.epic.build_version=$(EPIC_BUILD_VERSION) \
    ro.epic.device=$(CUSTOM_BUILD) \
    ro.epic.version=$(EPIC_VERSION) \
    ro.epic.maintainer=$(EPIC_MAINTAINER)

# Signing
ifeq (user,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/aosp/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/aosp/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/aosp/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/aosp/signing/keys/otakey.x509.pem
endif
endif
