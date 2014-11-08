# Makefile for fortuner2

# Name and version
PACKAGE = fortuner2
VERSION = 2014.07.2

# External programs
INSTALL      = install
INSTALL_DATA = install -m 644

# Directories
prefix      = /usr/local
bindir      = $(prefix)/bin
datarootdir = $(prefix)/share
sysconfdir  = $(prefix)/etc
localedir   = $(datarootdir)/locale
mandir      = $(datarootdir)/man
desktopdir  = $(datarootdir)/applications
appdatadir  = $(datarootdir)/appdata
icondir     = $(datarootdir)/icons

all: fortuner2 translations icons

# Include makefile fragments
include i18n.mk
include icons.mk

# The script itself
fortuner2: fortuner2.in
	sed -e "s/@PACKAGE@/$(PACKAGE)/" \
		-e "s/@VERSION@/$(VERSION)/" \
		-e "s/@sysconfdir@/$(subst /,\/,$(sysconfdir))/" \
		-e "s/@localedir@/$(subst /,\/,$(localedir))/" \
		$< >$@
	chmod +x $@

# Installation
install: fortuner2 install-icons install-translations
	$(INSTALL) -d "$(DESTDIR)$(bindir)"
	$(INSTALL) fortuner2 "$(DESTDIR)$(bindir)"

	$(INSTALL) -d "$(DESTDIR)$(desktopdir)"
	$(INSTALL_DATA) fortuner2.desktop "$(DESTDIR)$(desktopdir)"

	$(INSTALL) -d "$(DESTDIR)$(appdatadir)"
	$(INSTALL_DATA) fortuner2.appdata.xml "$(DESTDIR)$(appdatadir)"

	$(INSTALL) -d "$(DESTDIR)$(mandir)/man6"
	$(INSTALL_DATA) doc/fortuner2.6 "$(DESTDIR)$(mandir)/man6"

clean: clean-translations
	rm -f fortuner2

.PHONY: all install clean
