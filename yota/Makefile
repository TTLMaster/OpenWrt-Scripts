include $(TOPDIR)/rules.mk

PKG_NAME:=yota
PKG_VERSION:=20161118

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/yota/Default
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Yota
	TITLE:=Scripts for cheat mobile operator regarding tethering detection
	MAINTAINER:=Ilya Fedin <fedin-ilja2010@ya.ru>
	URL:=https://github.com/ilya-fedin/yota
	PKGARCH:=all
endef

define Package/yota/Default/description
	Yota - Russian virtual mobile operator, who blocks tethering at smartpone sim.
	People not wish waste money for modem, and cheats Yota and other mobile operators regarding tethering detection.
	These scripts helps you cheat your mobile operator!
endef

define Package/yota
$(call Package/yota/Default)
	TITLE+= (base files)
	DEPENDS:=+gcom +iptables-mod-ipopt
endef

define Package/yota/description
$(call Package/yota/Default/description)
	Base files for cheat - fix ttl, etc.
endef

define Package/yotaban
$(call Package/yota/Default)
	TITLE+= (bans bad IPs)
	DEPENDS:=+yota +iptables
endef

define Package/yotaban/description
$(call Package/yota/Default/description)
	Ban bad IPs with iptables.
endef

define Package/yotaban-nossl
$(call Package/yota/Default)
	TITLE+= (bans bad IPs, mirror source)
	DEPENDS:=+yota
endef

define Package/yotaban-nossl/description
$(call Package/yota/Default/description)
	Ban bad IPs with iptables - alternate source without https.
endef

define Package/yotareboot
$(call Package/yota/Default)
	TITLE+= (reboots on tethering detection)
	DEPENDS:=+yota +wget
endef

define Package/yotareboot/description
$(call Package/yota/Default/description)
	Autoreboot your router at beggar and don't leave your beach!
endef

define Package/yota/conffiles
/etc/config/yota
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yota/install
        $(CP) ./files/* $(1)
endef

define Package/yotaban/install
        $(CP) ./files-ban/* $(1)
endef

define Package/yotaban-nossl/install
        $(CP) ./files-ban-nossl/* $(1)
endef

define Package/yotareboot/install
        $(CP) ./files-reboot/* $(1)
endef

define Package/yota/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Enabling rc.d symlink for yota"
        /etc/init.d/ttl enable
fi
exit 0
endef

define Package/yota/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Removing rc.d symlink for yota"
        /etc/init.d/ttl disable
fi
exit 0
endef


define Package/yotaban/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Enabling rc.d symlink for yotaban"
        /etc/init.d/yotaban enable
fi
exit 0
endef

define Package/yotaban/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Removing rc.d symlink for yotaban"
        /etc/init.d/yotaban disable
fi
exit 0
endef

define Package/yotaban-nossl/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Enabling rc.d symlink for yotaban-nossl"
        /etc/init.d/yotaban enable
fi
exit 0
endef

define Package/yotaban-nossl/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Removing rc.d symlink for yotaban-nossl"
        /etc/init.d/yotaban disable
fi
exit 0
endef

define Package/yotareboot/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Enabling rc.d symlink for yotareboot"
        /etc/init.d/yotareboot enable
fi
exit 0
endef

define Package/yotareboot/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Removing rc.d symlink for yotareboot"
        /etc/init.d/yotareboot disable
fi
exit 0
endef

$(eval $(call BuildPackage,yota))
$(eval $(call BuildPackage,yotaban))
$(eval $(call BuildPackage,yotaban-nossl))
$(eval $(call BuildPackage,yotareboot))
