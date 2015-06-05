;;; Override and fix things that I don't like in the official prelude repo

;;; Code:

;;; Personal key-bindings
(global-unset-key (kbd "C-x C-m"))
(global-set-key (kbd "C-c C-m") 'smex)
