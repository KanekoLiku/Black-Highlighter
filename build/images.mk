# Variables
IMAGE_COPY_SOURCES := $(wildcard origin/src/img/page-toolbar-icons/* origin/src/img/text-editor-icons/* origin/src/img/social-icons/*)
IMAGE_COPY_OUTPUTS := $(patsubst origin/src/img/%,dist/img/%,$(IMAGE_COPY_SOURCES))

IMAGE_OPTIMIZE_SOURCES := $(wildcard origin/src/img/*)
IMAGE_OPTIMIZE_OUTPUTS := $(patsubst origin/src/img/%,dist/img/%,$(IMAGE_OPTIMIZE_SOURCES))

# Images to copy
dist/img/page-toolbar-icons/%: origin/src/img/page-toolbar-icons/% $(IMAGE_COPY_SOURCES)
	build/install.sh 644 $< $@

dist/img/text-editor-icons/%: origin/src/img/text-editor-icons/% $(IMAGE_COPY_SOURCES)
	build/install.sh 644 $< $@

dist/img/social-icons/%: origin/src/img/social-icons/% $(IMAGE_COPY_SOURCES)
	build/install.sh 644 $< $@

# Images to optimize
dist/img/%.png: origin/src/img/%.png $(IMAGE_OPTIMIZE_SOURCES) node_modules
	bun svgo $< -o $@

dist/img/%.svg: origin/src/img/%.svg $(IMAGE_OPTIMIZE_SOURCES) node_modules
	bun svgo $< -o $@
