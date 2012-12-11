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
TRANSLATED =

.PHONY: clean

all: fortuner2 translations

fortuner2: fortuner2.in
	sed -e "s/@PACKAGE@/$(PACKAGE)/" \
	-e "s/@VERSION@/$(VERSION)/" \
	-e "s/@LOCALEDIR@/$(subst /,\/,$(DESTDIR)$(LOCALEDIR))/" \
	fortuner2.in > fortuner2

	chmod +x fortuner2

translations:
	for lang in $(TRANSLATED); do \
	mkdir -p locale/$$lang/LC_MESSAGES/; \
	msgfmt --output-file=locale/$$lang/LC_MESSAGES/$(PACKAGE).mo \
	--verbose --statistics \
	po/$$lang.po; \
	done

po/fortuner2.pot: fortuner2
	xgettext --output="po/fortuner2.pot" --language="Shell" \
	--copyright-holder="Juhani Numminen <juhaninumminen0@gmail.com>" \
	--package-name="$(PACKAGE)" --package-version="$(VERSION)" \
	--msgid-bugs-address="https://github.com/jnumm/fortuner2/issues" \
	fortuner2

install:
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) fortuner2 $(DESTDIR)$(BINDIR)

	for lang in $(TRANSLATED); do \
	$(INSTALL) -d $(DESTDIR)$(LOCALEDIR)/$$lang/LC_MESSAGES; \
	$(INSTALL) locale/$$lang/LC_MESSAGES/$(PACKAGE).mo \
	$(DESTDIR)$(LOCALEDIR)/$$lang/LC_MESSAGES; \
	done

clean:
	rm -rf fortuner2 locale/
