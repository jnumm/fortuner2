# icons.mk - Optionally re-generate icons from svg source

svgsource = icons/scalable/apps/fortuner2.svg

pngsizes = 22x22 24x24 48x48
pngfiles = $(patsubst %,icons/%/apps/fortuner2.png,$(pngsizes))

xpmsizes = 32x32
xpmfiles = $(patsubst %,icons/%/apps/fortuner2.xpm,$(xpmsizes))

icons: $(pngfiles) $(xpmfiles)

icons/%/apps/fortuner2.png icons/%/apps/fortuner2.xpm: $(svgsource)
	mkdir -p "$(dir $@)"
	convert -background none -geometry $* $< $@

install-icons: $(patsubst %,install-%,$(pngfiles) $(xpmfiles))
install-icons: install-$(svgsource)

install-icons/%: icons/%
	$(INSTALL) -d "$(DESTDIR)$(icondir)/hicolor/$(dir $*)"
	$(INSTALL_DATA) icons/$* "$(DESTDIR)$(icondir)/hicolor/$(dir $*)"

clean-icons:
	rm -rf $(patsubst %,icons/%,$(pngsizes) $(xpmsizes))

.PHONY: icons install-icons clean-icons
