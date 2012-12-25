# Makefile for fortuner2
# Copyright (C) 2012 Juhani Numminen <juhaninumminen0@gmail.com>
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
VERSION = 0.3.0

# External programs.
INSTALL = install -c

# Directories.
DESTDIR =
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share
LOCALEDIR = $(DATADIR)/locale
MANDIR = $(DATADIR)/man
XDG_DESKTOP_DIR = $(DATADIR)/applications
ICONDIR = $(DATADIR)/icons

# List of country codes which have a translation.
TRANSLATED = $(notdir $(basename $(wildcard po/*.po)))
# List mo files to create.
MOFILES = $(addprefix locale/,\
$(addsuffix /LC_MESSAGES/$(PACKAGE).mo,$(TRANSLATED)))

# List of icon sizes.
ICONS = $(subst icons/,,$(wildcard icons/*))

# Newline character.
define \n


endef

.PHONY: clean

all: $(PACKAGE) translations

$(PACKAGE): fortuner2.in
	sed -e "s/@PACKAGE@/$(PACKAGE)/" \
	-e "s/@VERSION@/$(VERSION)/" \
	-e "s/@LOCALEDIR@/$(subst /,\/,$(DESTDIR)$(LOCALEDIR))/" \
	"$<" >"$(PACKAGE)"

	chmod +x "$(PACKAGE)"

translations: $(MOFILES)

locale/%/LC_MESSAGES/$(PACKAGE).mo: po/%.po
	mkdir -p "$(dir $@)"
	msgfmt --output-file="$@" --check --verbose --statistics "$<"

po/$(PACKAGE).pot: fortuner2.in
	xgettext --output="$@" --language="Shell" \
	--copyright-holder="Juhani Numminen <juhaninumminen0@gmail.com>" \
	--package-name="$(PACKAGE)" --package-version="$(VERSION)" \
	--msgid-bugs-address="https://github.com/jnumm/fortuner2/issues" \
	"$<"

install: $(PACKAGE) translations
	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
	$(INSTALL) "$(PACKAGE)" "$(DESTDIR)$(BINDIR)"

	desktop-file-install --dir="$(abspath $(DESTDIR)$(XDG_DESKTOP_DIR))" \
	"fortuner2.desktop"

ifneq ($(strip $(TRANSLATED)),)
	$(INSTALL) -d $(addprefix "$(DESTDIR)$(LOCALEDIR)/,\
	$(addsuffix /LC_MESSAGES",$(TRANSLATED)))
	$(foreach lang,$(TRANSLATED),\
	$(INSTALL) --mode=644 "locale/$(lang)/LC_MESSAGES/$(PACKAGE).mo" \
	"$(DESTDIR)$(LOCALEDIR)/$(lang)/LC_MESSAGES"$(\n))
endif

	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man6"
	$(INSTALL) --mode=644 "doc/fortuner2.6" "$(DESTDIR)$(MANDIR)/man6"
	gzip -9 "$(DESTDIR)$(MANDIR)/man6/fortuner2.6"

ifneq ($(strip $(ICONS)),)
	$(INSTALL) -d $(addprefix "$(DESTDIR)$(ICONDIR)/hicolor/,\
	$(addsuffix /apps",$(ICONS)))
	$(foreach size,$(ICONS),\
	$(INSTALL) --mode=644 $(wildcard icons/$(size)/apps/*) \
	"$(DESTDIR)$(ICONDIR)/hicolor/$(size)/apps"$(\n))
endif

clean:
	rm -rf $(PACKAGE) locale
