# Set epic specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common epic stuff
$(call inherit-product, vendor/epic/config/common_mini_phone.mk)
