# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Gapps
$(call inherit-product, vendor/gms/gms_mini.mk)

# Gboard side padding
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.kb_pad_port_l=4 \
    ro.com.google.ime.kb_pad_port_r=4 \
    ro.com.google.ime.kb_pad_land_l=64 \
    ro.com.google.ime.kb_pad_land_r=64

# Gapps overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/epic/overlay/gms
	
# Setup some Flags, can be disabled in Device tree
TARGET_INCLUDE_STOCK_ARCORE ?= true
TARGET_INCLUDE_LIVE_WALLPAPERS ?= true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT ?= true	


