INSTALL := install -m 644 -CD


EMACS.D := ~/.emacs.d
DESTDIR := $(EMACS.D)
SRC_DIR := src
PRELUDE_DIR= prelude
PERSONAL_DIR := $(SRC_DIR)/personal
PERSONAL_SRCS := $(shell find $(PERSONAL_DIR)/ -type f -name '*.el')
PERSONAL_TARGETS := $(patsubst $(SRC_DIR)/%,$(DESTDIR)/%,$(PERSONAL_SRCS))

MODULES_DIR := $(SRC_DIR)/modules
MODULES_SRCS := $(wildcard $(MODULES_DIR)/*.el)
MODULES_TARGETS := $(patsubst $(SRC_DIR)/%,$(DESTDIR)/%,$(MODULES_SRCS))

install: $(MODULES_TARGETS) $(PERSONAL_TARGETS)

## private worker targets

# install personal files in destination
$(DESTDIR)/personal/%: $(PERSONAL_DIR)/% install-prelude
	$(INSTALL) $< $@

$(DESTDIR)/modules/%: $(MODULES_DIR)/% install-prelude
	$(INSTALL) $< $@

install-prelude:
	rsync -rupE --delete-excluded --exclude .git** prelude/ $(EMACS.D)

clean-install:
	-rm -rf $(EMACS.D)

.PHONY: install-prelude
