(defvar cabbage-bundles)
(defvar cabbage-theme)
(setq cabbage-bundles
      ;; The bundles listed here are enabled on emacs start.
      ;; Full list of bundles: https://github.com/senny/cabbage/wiki/Bundles

      '(
        git
        snippets
        ))


;; Configure your favorite color theme.
;; Available themes: https://github.com/senny/theme-roller.el/tree/master/themes
(setq cabbage-theme 'color-theme-lazy)
