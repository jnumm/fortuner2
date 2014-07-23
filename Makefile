# Makefile for fortuner2
# Copyright (C) 2012-2014 Juhani Numminen <juhaninumminen0@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Name and version
PACKAGE = fortuner2
VERSION = 2014.07.2

# External programs.
INSTALL = install
MANCOMPRESS = gzip -f -9

# Directories.
DESTDIR =
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share
SYSCONFDIR = $(PREFIX)/etc
LOCALEDIR = $(DATADIR)/locale
MANDIR = $(DATADIR)/man
XDG_DESKTOP_DIR = $(DATADIR)/applications
APPDATA_DIR = $(DATADIR)/appdata
ICONDIR = $(DATADIR)/icons

# List of country codes which have a translation.
TRANSLATED = $(notdir $(basename $(wildcard po/*.po)))
# List mo files to create.
MOFILES = $(addprefix locale/,\
$(addsuffix /LC_MESSAGES/$(PACKAGE).mo,$(TRANSLATED)))

# Newline character.
define \n


endef

HELPTEXT = Makefile usage\
\nOptions (current value)\
\nPlease set the ones you want to customize on every invocation of make.\
\n\
\n DESTDIR         ($(DESTDIR))\
\n PREFIX          ($(PREFIX))\
\n BINDIR          ($(BINDIR))\
\n DATADIR         ($(DATADIR)\
\n SYSCONFDIR      ($(SYSCONFDIR))\
\n LOCALEDIR       ($(LOCALEDIR))\
\n MANDIR          ($(MANDIR))\
\n XDG_DESKTOP_DIR ($(XDG_DESKTOP_DIR))\
\n APPDATA_DIR     ($(APPDATA_DIR))\
\n ICONDIR         ($(ICONDIR))\
\n\
\n INSTALL         ($(INSTALL))\
\n MANCOMPRESS     ($(MANCOMPRESS))\
\n  UNIX manpage compression. Set to empty not to compress manpage.\
\n\
\n TRANSLATED      ($(TRANSLATED))\
\n  Available translations. Set to empty to compile and install none.\
\n\
\nTargets\
\n\
\n all\
\n $(PACKAGE)\
\n translations\
\n\
\n install\
\n clean\
\n\
\n po/$(PACKAGE).pot\
\n\
\n help

.PHONY: clean help

all: $(PACKAGE) translations

$(PACKAGE): fortuner2.in
	sed -e "s/@PACKAGE@/$(PACKAGE)/" \
	-e "s/@VERSION@/$(VERSION)/" \
	-e "s/@SYSCONFDIR@/$(subst /,\/,$(SYSCONFDIR))/" \
	-e "s/@LOCALEDIR@/$(subst /,\/,$(LOCALEDIR))/" \
	"$<" >"$(PACKAGE)"

	chmod +x "$(PACKAGE)"

translations: $(MOFILES)

locale/%/LC_MESSAGES/$(PACKAGE).mo: po/%.po
	mkdir -p "$(dir $@)"
	msgfmt --output-file="$@" --check --verbose --statistics "$<"

po/$(PACKAGE).pot: fortuner2.in
	xgettext --output="$@" --language="Shell" --package-name="$(PACKAGE)" \
	--copyright-holder="Juhani Numminen <juhaninumminen0@gmail.com>" \
	--msgid-bugs-address="https://github.com/jnumm/fortuner2/issues" \
	"$<"

install: $(PACKAGE) translations
	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
	$(INSTALL) -m755 "$(PACKAGE)" "$(DESTDIR)$(BINDIR)"

ifneq ($(strip $(shell which desktop-file-install 2>/dev/null)),)
	desktop-file-install --dir="$(abspath $(DESTDIR)$(XDG_DESKTOP_DIR))" \
	"fortuner2.desktop"
else
	$(INSTALL) -d "$(DESTDIR)$(XDG_DESKTOP_DIR)"
	$(INSTALL) -m644 "fortuner2.desktop" "$(DESTDIR)$(XDG_DESKTOP_DIR)"
endif

	$(INSTALL) -d "$(DESTDIR)$(APPDATA_DIR)"
	$(INSTALL) -m644 "fortuner2.appdata.xml" "$(DESTDIR)$(APPDATA_DIR)"

	$(INSTALL) -d "$(DESTDIR)$(LOCALEDIR)"
	cp -R locale/* "$(DESTDIR)$(LOCALEDIR)"

	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man6"
	$(INSTALL) -m644 "doc/fortuner2.6" "$(DESTDIR)$(MANDIR)/man6"

ifneq ($(strip $(MANCOMPRESS)),)
	$(MANCOMPRESS) "$(DESTDIR)$(MANDIR)/man6/fortuner2.6"
endif

	$(INSTALL) -d "$(DESTDIR)$(ICONDIR)/hicolor"
	cp -R icons/* "$(DESTDIR)$(ICONDIR)/hicolor"

clean:
	rm -rf $(PACKAGE) locale

help:
	@echo "$(HELPTEXT)"
