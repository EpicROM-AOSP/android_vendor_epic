# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# epic OTA update package

EPIC_ZIP_NAME := $(EPIC_VERSION).zip
EPIC_TARGET_PACKAGE := $(PRODUCT_OUT)/$(EPIC_ZIP_NAME)

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	@echo "EpicROM OTA package"
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(EPIC_TARGET_PACKAGE)
	@echo ""
	@echo "Package Completed:"
	@echo ""
	@echo "                  EpicROM from the bottom                          "
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "Zip: $(EPIC_TARGET_PACKAGE)"
	@echo "Size: `du -h "$(EPIC_TARGET_PACKAGE)" | cut -f1`"
	@echo "SHA256: `sha256sum $(EPIC_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "MD5: `md5sum $(EPIC_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "" >&2

