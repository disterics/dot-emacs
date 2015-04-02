INSTALL := install -m 644 -CD


EMACS.D := ~/.emacs.d
DESTDIR := $(EMACS.D)
SRC_DIR := src
PRELUDE_DIR= prelude
PERSONAL_DIR := $(SRC_DIR)/personal
PERSONAL_SRCS := $(wildcard $(PERSONAL_DIR)/*.el)
PERSONAL_TARGETS := $(patsubst $(SRC_DIR)/%,$(DESTDIR)/%,$(PERSONAL_SRCS))

# compilation targets
SUBDIRS := prelude
ELCS := $(SRCS:.el=.elc)

install: $(PERSONAL_TARGETS)

## private worker targets

# install personal files in destination
$(DESTDIR)/personal/%: $(PERSONAL_DIR)/% install-prelude
	$(INSTALL) $< $@

install-prelude:
	rsync -rupE --delete-excluded --exclude .git** prelude/ $(EMACS.D)/.

clean-install:
	-rm -rf $(EMACS.D)

.PHONY: install-prelude
