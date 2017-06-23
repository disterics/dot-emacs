;;; hb-php.el --- Emacs Prelude: php-mode configuration.
;;
;; Copyright © 2011-2017 disterics
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

(prelude-require-packages '(php-mode))

(require 'php-mode)

(eval-after-load 'js2-mode
  '(progn
     (defun hb-php-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with smartparens
       (php-enable-psr2-coding-style)
       )

     (setq hb-php-mode-hook 'hb-php-mode-defaults)

     (add-hook 'php-mode-hook (lambda () (run-hooks 'hb-php-mode-hook)))))

(provide 'hb-php)

;;; hb-php.el ends here
