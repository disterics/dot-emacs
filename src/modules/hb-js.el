;;; hb-js.el --- Emacs Prelude: js-mode configuration.
;;
;; Copyright © 2011-2015 Bozhidar Batsov
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for js-mode.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'prelude-programming)
(prelude-require-packages '(js2-mode json-mode))

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"     . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"    . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun hb-js-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with smartparens
       (setq-local electric-layout-rules '((?\; . after)))
       (setq mode-name "JS2")
       (setq js2-basic-offset 2)
       (setq js2-bounce-indent-p t)
       (setq js2-strict-trailing-comma-warning nil)
       (js2-imenu-extras-mode +1))

     (setq hb-js-mode-hook 'hb-js-mode-defaults)

     (add-hook 'js2-mode-hook (lambda () (run-hooks 'hb-js-mode-hook)))))

(provide 'hb-js)

;;; hb-js.el ends here
