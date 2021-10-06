# SPDX-License-Identifier: AGPL-3.0-or-later

ANT ?= ant
ZIMBRA_PREFIX ?= /opt/zimbra

IDIR = $(DESTDIR)$(ZIMBRA_PREFIX)

JARFILE=ant-tar-patched.jar

all:
	rm -Rf build
	$(ANT)

define mk_instdir
mkdir -p $(IDIR)/$(strip $(1))
endef

install:
	$(call mk_instdir, lib/jars)
	cp build/$(JARFILE) $(IDIR)/lib/jars/$(JARFILE)

clean:
	rm -Rf build
