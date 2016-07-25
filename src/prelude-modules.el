;;; the prelude modules to enable

(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-company)

;;; Custom hb modules

;;; In Dolby environment
(DolbyDev
 (require 'hb-p4)
 (when (getenv "ECLIPSE_HOME")
   (require 'hb-eclim)
   (message "Loaded eclim"))
 (message "Done loading Dolby Dev Requirements"))

(CentOS5Dev
 (setq-default flycheck-disabled-checkers '(c/c++-gcc))
 (message "Done loading CentOS5 Dev requirements"))


;;; Programming languages support
(require 'prelude-emacs-lisp)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-python)
(require 'prelude-ruby)
(require 'prelude-shell)
(require 'prelude-xml)
(require 'prelude-yaml)

;;; Custom programming languages support
(require 'hb-c)
(require 'hb-js)

;;; prelude-modules.el ends here
