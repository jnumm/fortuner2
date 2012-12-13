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
VERSION = 0.1.0

# External programs.
INSTALL = install -c

# Directories.
DESTDIR =
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
LOCALEDIR = $(PREFIX)/share/locale

# List of country codes which have a translation.
TRANSLATED = $(notdir $(basename $(wildcard po/*.po)))
# List mo files to create.
MOFILES = $(addprefix locale/,\
$(addsuffix /LC_MESSAGES/$(PACKAGE).mo,$(TRANSLATED)))

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

ifneq ($(strip $(TRANSLATED)),)
	$(INSTALL) -d $(addprefix "$(DESTDIR)$(LOCALEDIR)/,\
	$(addsuffix /LC_MESSAGES",$(TRANSLATED)))
	$(foreach lang,$(TRANSLATED),\
	$(INSTALL) "locale/$(lang)/LC_MESSAGES/$(PACKAGE).mo" \
	"$(DESTDIR)$(LOCALEDIR)/$(lang)/LC_MESSAGES"$(\n))
endif

clean:
	rm -rf $(PACKAGE) locale
