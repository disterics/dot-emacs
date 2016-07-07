;;; hb-c.el --- Emacs Prelude: cc-mode configuration.
;;
;; Copyright © 2015-2016 disterics
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for cc-mode and the modes derived from it.

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
(prelude-require-packages '(google-c-style))

(require 'google-c-style)

(eval-after-load 'google-c-style
  '(progn
     (defun hb-c-mode-common-defaults ()
       (google-set-c-style)
       (google-make-newline-indent)
       (setq c-basic-offset 4)
       (c-set-offset 'substatement-open 0)
       (c-set-offset 'innamespace . [0]))

     (setq hb-c-mode-common-hook 'hb-c-mode-common-defaults)

     (add-hook 'c-mode-common-hook (lambda () (run-hooks 'hb-c-mode-common-hook)))))

(defun hb-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(setq hb-makefile-mode-hook 'hb-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'hb-makefile-mode-hook)))

(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (other . "Google")))

(provide 'hb-c)

;;; hb-c.el ends here
