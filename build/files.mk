# Variables
FILES_SOURCES := \
	origin/src/misc/gitattributes
FILES_OUTPUTS := \
	dist/.gitattributes

dist/.gitattributes: origin/src/misc/gitattributes
	build/install.sh 644 $< $@
