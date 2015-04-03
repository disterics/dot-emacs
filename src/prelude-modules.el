;;; the prelude modules to enable

(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-company)

;;; Custom hb modules

;;; In Dolby environment
(DolbyDev
 (require 'hb-p4)
 (message "Done loading Dolby Dev Requirements"))

(CentOS5Dev
 (setq-default flycheck-disabled-checkers '(c/c++-gcc))
 (message "Done loading CentOS5 Dev requirements"))

;;; Programming languages support
(require 'prelude-c)
(require 'prelude-emacs-lisp)
(require 'prelude-js)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-python)
(require 'prelude-ruby)
(require 'prelude-scala)
(require 'prelude-shell)
(require 'prelude-xml)
(require 'prelude-yaml)
