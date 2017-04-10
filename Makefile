# Makefile for nodepi package
# 
# Creates a debian that will install the program in /opt
#
NAME = nodepi
VERSION ?= 1.0.0
DESTDIR ?= /
TAR_INCLUDES = Makefile src/ node_modules/
PKG_DIR = /opt/$(NAME)

.PHONY: default deb orig install

# There's no "build" step for JS projects, but debuild needs a default target
default:
	@echo "Ready for installation"

deb: orig
	debuild -us -uc -i -b --lintian-opts --profile debian

orig:
	tar zcf ../$(NAME)_$(VERSION).orig.tar.gz $(TAR_INCLUDES)

install:
	mkdir -p $(DESTDIR)/$(PKG_DIR)
	cp -r node_modules $(DESTDIR)/$(PKG_DIR)
	cp -r src $(DESTDIR)/$(PKG_DIR)
	cp debian/nodepi.sh $(DESTDIR)/$(PKG_DIR)
	mkdir -p $(DESTDIR)/lib/systemd/system
	cp debian/nodepi.service $(DESTDIR)/lib/systemd/system/

