# EpicROM properties - used by firmware version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.epic.maintainer=$(EPIC_MAINTAINER) \
    ro.epic.code=$(EPIC_CODENAME) \
    ro.epic.packagetype=$(EPIC_PACKAGE_TYPE) \
    ro.epic.releasetype=$(EPIC_BUILDTYPE) \
    ro.epic.version?=$(EPIC_VERSION) \
    ro.epic.chipset?=$(EPIC_CHIPSET) \
    ro.epic.build.version=$(LINEAGE_VERSION) \
    ro.epic.display.version?=$(LINEAGE_DISPLAY_VERSION) \
    ro.epic.platform_release_codename=$(EPIC_FLAVOR)
