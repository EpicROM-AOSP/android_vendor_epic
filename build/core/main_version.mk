# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# epic Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.epic.display.version=$(EPIC_DISPLAY_VERSION) \
    ro.epic.build.version=$(EPIC_BUILD_VERSION) \
    ro.epic.build.date=$(BUILD_DATE) \
    ro.epic.buildtype=$(EPIC_BUILD_TYPE) \
    ro.epic.fingerprint=$(ROM_FINGERPRINT) \
    ro.epic.version=$(EPIC_VERSION) \
    ro.epic.build_security_patch=$(EPIC_SECURITY_PATCH) \
    ro.modversion=$(EPIC_VERSION) \
    ro.epic.maintainer=$(EPIC_MAINTAINER)