include cabbage/common.inc

SRCS := init.el config.el
DESTDIR := $(EMACS.D)
DESTDIRS := $(DESTDIR)

# compilation targets
SUBDIRS := cabbage
ELCS := $(SRCS:.el=.elc)

include cabbage/makefile.inc

# install: all destdirs files
# -for f in $(ELCS); do (install $$f $(EMACS.D)/. ); done

install-cabbage:
	$(MAKE) -C cabbage install

install-cabbage-debug:
	$(MAKE) -C cabbage install-debug

install-debug:
	-for f in $(SRCS); do (install $$f $(EMACS.D)/. ); done

clean-install:
	-rm -rf $(EMACS.D)

.PHONY: install install-cabbage install-debug clean-install install-cabbage-debug
