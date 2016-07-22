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

;; Define function lineing up arguments using tabs only
;; this is used for coding in the linux kernel
;; Code is from https://www.kernel.org/doc/Documentation/CodingStyle
(defun hb-c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

;; function that allows turning off whitespace tab visualization
;; needed for working with linux code
(eval-after-load 'whitespace
  '(progn
     (defun hb-whitespace-tab-mode (enable)
       "Enables whitespace visualization of tabs if enable is true."
       (if enable
           (unless (member 'tabs whitespace-active-style)
             (whitespace-toggle-options '(tabs)))
         (when (member 'tabs whitespace-active-style)
           (whitespace-toggle-options '(tabs)))
         ))))

(defun hb-add-linux-kernel-c-style ()
  "Add kernel style"
  (c-add-style
   "linux-tabs-only"
   '("linux" (c-offsets-alist
              (arglist-cont-nonempty
               c-lineup-gcc-asm-reg
               hb-c-lineup-arglist-tabs-only)))))


;; update google-c-style with some of my preferred options
(eval-after-load 'google-c-style
  '(progn
     (defun hb-c-mode-common-defaults ()
       (hb-add-linux-kernel-c-style)
       (google-set-c-style)
       (google-make-newline-indent)
       (setq c-basic-offset 4)
       (c-set-offset 'substatement-open 0)
       (c-set-offset 'innamespace 0)
       (setq c-default-style
             '((java-mode . "java")
               (awk-mode . "awk")
               (other . "Google"))))

     (setq hb-c-mode-common-hook 'hb-c-mode-common-defaults)

     (add-hook 'c-mode-common-hook (lambda () (run-hooks 'hb-c-mode-common-hook)))))

(defun hb-c-mode-hook-defaults()
  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (when (and filename
               (string-match (expand-file-name "/*kernel*/")
                             filename)
               (locate-dominating-file filename "Kbuild"))
      (message "Kernel source code detected. Setting c-style to 'linux-tabs-only")
      (setq indent-tabs-mode t)
      ;; (setq show-trailing-whitespace t) // always on anyway
      (if (fboundp 'hb-whitespace-tab-mode)
          (hb-whitespace-tab-mode nil))
      (c-set-style "linux-tabs-only")
      )))

(setq hb-c-mode-hook 'hb-c-mode-hook-defaults)
(add-hook 'c-mode-hook (lambda () (run-hooks 'hb-c-mode-hook)))


(defun hb-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(setq hb-makefile-mode-hook 'hb-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda () (run-hooks 'hb-makefile-mode-hook)))



(provide 'hb-c)

;;; hb-c.el ends here
