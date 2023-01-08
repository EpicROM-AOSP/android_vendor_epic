# Inherit full common epic stuff
$(call inherit-product, vendor/epic/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include epic LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/epic/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/epic/overlay/dictionaries
