#
#
include $(TOPDIR)/rules.mk

PKG_NAME:=linbpq
PKG_VERSION:=6.0.23
PKG_RELEASE:=1
PKG_LICENSE:=BSD-3-Clause

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.kutukupret.com
PKG_MD5SUM:=46d819e087a558f131d4adae095aebca

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/linbpq
  SECTION:=net
  CATEGORY:=mypackages
  DEPENDS:= +libconfig +libpthread +libstdcpp +libminiupnpc +libpcap +libcap-bin +zlib
  TITLE:=Hamradio APRS iGate / Digipeater
  URL:=https://www.kutukupret.com
  MAINTAINER:=hari
endef

define Package/linbpq/description
  linbpq is a packet radio software for amateur.
endef

#TARGET_CFLAGS+=$(CFLAGS) -fcommon -fhonour-copts

#CONFIGURE_ARGS += \
#	--with-embedded \
#	--with-pthread

#CONFIGURE_VARS += \
#	#TARGET_CFLAGS+= -fcommon
#	TARGET_CFLAGS:=$(TARGET_CFLAGS) -fcommon

#define Build/linbpq/Configure
#	$(call Build/Configure/Default)
#endef

define Build/Compile
	$(call Build/Compile/Default,LD=$(TARGET_CC))
endef

define Package/linbpq/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/linbpq $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,linbpq))
