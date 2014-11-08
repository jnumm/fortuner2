# i18n.mk - I18n with GNU gettext tools

MSGID_BUGS_ADDRESS = https://github.com/jnumm/fortuner2/issues

languages := $(notdir $(basename $(wildcard po/*.po)))
mofiles := $(patsubst %,locale/%/LC_MESSAGES/$(PACKAGE).mo,$(languages))

translations: $(mofiles)

locale/%/LC_MESSAGES/$(PACKAGE).mo: po/%.po
	mkdir -p "$(dir $@)"
	msgfmt -o "$@" -c -v --statistics "$<"

install-translations: $(patsubst %,install-%,$(mofiles))

install-locale/%: locale/%
	$(INSTALL) -d "$(DESTDIR)$(localedir)/$(dir $*)"
	$(INSTALL_DATA) locale/$* "$(DESTDIR)$(localedir)/$(dir $*)"

clean-translations:
	rm -rf locale

po/$(PACKAGE).pot: fortuner2.in
	xgettext -o "$@" -L Shell --package-name="$(PACKAGE)" \
		--msgid-bugs-address="$(MSGID_BUGS_ADDRESS)" \
		$<

.PHONY: translations install-translations clean-translations
