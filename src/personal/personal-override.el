;;; Override and fix things that I don't like in the official prelude repo

;; disable find-file-sudo advice since it causes issues when working with perforce files
(ad-disable-advice 'ido-find-file 'after 'find-file-sudo)
(ad-activate 'ido-find-file)
