# Variables
FONTS_COPY_SOURCES := $(wildcard origin/src/fonts/* origin/src/fonts/int/japanese/* )
FONTS_COPY_OUTPUTS := $(patsubst origin/src/fonts/%,dist/fonts/%,$(FONTS_COPY_SOURCES))

# Fonts to copy
dist/fonts/%: origin/src/fonts/%
	build/install.sh 644 $< $@

dist/fonts/int/japanese/%: origin/src/fonts/int/japanese/%
	build/install.sh 644 $< $@
