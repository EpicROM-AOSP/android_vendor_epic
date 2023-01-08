# Set epic specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common epic stuff
$(call inherit-product, vendor/epic/config/common_full_phone.mk)
