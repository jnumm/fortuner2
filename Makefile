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

# List of country codes which have a translation.
TRANSLATED =

.PHONY: clean

fortuner2:
	sed -e "s/@PACKAGE@/$(PACKAGE)/" \
	-e "s/@VERSION@/$(VERSION)/" \
	fortuner2.in > fortuner2

	chmod +x fortuner2

translations:
	for lang in $(TRANSLATED); do \
	mkdir -p locale/$$lang/LC_MESSAGES/; \
	msgfmt --output-file=locale/$$lang/LC_MESSAGES/$(PACKAGE).mo \
	--verbose --statistics \
	po/$$lang.po; \
	done

po/$(PACKAGE).pot:
	xgettext --output="po/$(PACKAGE).pot" --language="Shell" \
	--copyright-holder="Juhani Numminen <juhaninumminen0@gmail.com>" \
	--package-name="$(PACKAGE)" --package-version="$(VERSION)" \
	--msgid-bugs-address="https://github.com/jnumm/fortuner2/issues" \
	fortuner2

clean:
	rm -rf fortuner2 locale/
