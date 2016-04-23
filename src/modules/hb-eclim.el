;;; hb-eclim.el --- Eclim setup
;;
;; Copyright © 2015-2016 disterics
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Configuration for eclim based on emacs-eclim documentation:
;; https://github.com/senny/emacs-eclim

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

(prelude-require-packages '(emacs-eclim))

;; now load eclim amd eclimd
(require 'eclim)
(require 'eclimd)

;; customize the eclipse and eclim locations using environment variables
(custom-set-variables
 '(eclim-eclipse-dirs (append (list (getenv "ECLIPSE_HOME")) eclim-eclipse-dirs))
 '(eclim-executable  (expand-file-name "eclim" (getenv "ECLIPSE_HOME"))))

(global-eclim-mode)

;; display error message in echo area when cursor is positioned on an error marker
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; integrate eclim into company mode
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

(provide 'hb-eclim)

;;; hb-eclim.el ends here
