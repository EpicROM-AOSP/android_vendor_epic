PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 1

EPIC_FLAVOR := Thirteen
EPIC_VERSION := 1.0
EPIC_CODENAME := Beta
EPIC := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

ifeq ($(filter $(CURRENT_DEVICE), $(DEVICE_LIST)), $(CURRENT_DEVICE))
   ifeq ($(filter $(EPIC_MAINTAINER), $(MAINTAINER_LIST)), $(EPIC_MAINTAINER))
      EPIC_BUILDTYPE := OFFICIAL
  else 
     # the builder is overriding official flag on purpose
     ifeq ($(EPIC_BUILDTYPE), OFFICIAL)
       $(error **********************************************************)
       $(error *     A violation has been detected, aborting build      *)
       $(error **********************************************************)
     else 
       $(warning **********************************************************************)
       $(warning *   There is already an official maintainer for $(CURRENT_DEVICE)    *)
       $(warning *              Setting build type to UNOFFICIAL                      *)
       $(warning *    Please contact current official maintainer before distributing  *)
       $(warning *              the current build to the community.                   *)
       $(warning **********************************************************************)
       EPIC_BUILDTYPE := UNOFFICIAL
     endif
  endif
else
   ifeq ($(EPIC_BUILDTYPE), OFFICIAL)
     $(error **********************************************************)
     $(error *     A violation has been detected, aborting build      *)
     $(error **********************************************************)
   endif
  EPIC_BUILDTYPE := COMMUNITY
endif

LINEAGE_VERSION_APPEND_TIME_OF_DAY ?= true
ifeq ($(LINEAGE_VERSION_APPEND_TIME_OF_DAY),true)
    LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d%H%M)
else
    LINEAGE_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

ifeq ($(WITH_GAPPS), true)
    ifeq ($(TARGET_CORE_GAPPS), true)
        EPIC_PACKAGE_TYPE ?= CORE
    else 
        EPIC_PACKAGE_TYPE ?= GAPPS
    endif
else
    EPIC_PACKAGE_TYPE ?= AOSP
endif

# Internal version
LINEAGE_VERSION := EpicROM-v$(EPIC_VERSION)-$(EPIC_CODENAME)-$(LINEAGE_BUILD_DATE)-$(CURRENT_DEVICE)-$(EPIC_PACKAGE_TYPE)-$(EPIC_BUILDTYPE)

# Display version
LINEAGE_DISPLAY_VERSION := EpicROM-v$(EPIC_VERSION)-$(EPIC_CODENAME)-$(CURRENT_DEVICE)-$(EPIC_PACKAGE_TYPE)-$(EPIC_BUILDTYPE)
