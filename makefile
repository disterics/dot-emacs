# Makefile
ifeq ($(OS),Windows_NT)
	detected_OS := Windows
else
	detected_OS := $(shell uname)
endif

ifeq ($(detected_OS),Darwin)
	INSTALL := install -m 644 -C
else
	INSTALL := install -m 644 -CD
endif

EMACS.D := ~/.local/etc/emacs
DESTDIR := $(EMACS.D)
SRC_DIR := src
PRELUDE_DIR= prelude
PERSONAL_DIR := $(SRC_DIR)/personal
PERSONAL_SRCS := $(shell find $(PERSONAL_DIR)/ -type f -name '*.el')
PERSONAL_TARGETS := $(patsubst $(SRC_DIR)/%,$(DESTDIR)/%,$(PERSONAL_SRCS))

MODULES_DIR := $(SRC_DIR)/modules
MODULES_SRCS := $(wildcard $(MODULES_DIR)/*.el)
MODULES_TARGETS := $(patsubst $(SRC_DIR)/%,$(DESTDIR)/%,$(MODULES_SRCS))

# variables for prelude-modules file
PRELUDE_MODULES_FILE := src/personal/prelude-modules.el
PRELUDE_MODULES_TARGET := $(patsubst $(SRC_DIR)/%,$(DESTDIR)/%,$(PRELUDE_MODULES_FILE))

# hack for installing prelude with dependency checking
INSTALL_PRELUDE := $(EMACS.D)/init.el
PRELUDE_INIT := $(PRELUDE_DIR)/init.el

install: $(MODULES_TARGETS) $(PERSONAL_TARGETS) $(PRELUDE_MODULES_TARGET)

$(PRELUDE_MODULES_TARGET): $(PRELUDE_MODULES_FILE) $(INSTALL_PRELUDE)
	$(INSTALL) $< $@

## private worker targets

# install personal files in destination
$(DESTDIR)/personal/%: $(PERSONAL_DIR)/% $(INSTALL_PRELUDE)
	$(INSTALL) $< $@

$(DESTDIR)/modules/%: $(MODULES_DIR)/% $(INSTALL_PRELUDE)
	$(INSTALL) $< $@

$(INSTALL_PRELUDE): $(PRELUDE_INIT)
	rsync -rupE --delete-excluded --exclude .git** prelude/ $(EMACS.D)

clean-install:
	-rm -rf $(EMACS.D)

.PHONY: install
