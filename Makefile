##
# Luigi Make
# Copyright 2014 Koreviz
# MIT Licensed
##
SHELL := /bin/bash

JUICE = $(shell find node_modules -name "juice" -type f)
MYTH = $(shell find node_modules -name "myth" -type f)
REPO = koreviz/luigi

all: configure compile

clean:
	rm -fR build
	rm -fr node_modules

compile:
	$(foreach css,$(shell find . -maxdepth 1 -name "*.css" -type f),$(MYTH) $(css) build/$(notdir $(css));)
	$(foreach html,$(shell find examples -maxdepth 1 -name "*.html" -type f),$(JUICE) $(html) build/$(notdir $(html));)

configure:
	npm install
	mkdir -p build

push:
	rm -fR .git
	git init
	git add .
	git commit -m "Initial release"
	git remote add origin gh:$(REPO).git
	git push origin master