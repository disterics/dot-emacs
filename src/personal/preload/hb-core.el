;;; hb-core.el --- Emacs Prelude: Core Prelude functions.
;;
;; Copyright © 2011-2015 distercs
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.2
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Here are the definitions of macros used by hb modules.

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


(defun get-env-soft (var)
  "Returns the value of the environment variable var, as a strung.
If var is undefined returns an empty string"
  (let ((value (getenv var)))
    (if value
        value
      "")))

(defmacro DolbyDev (&rest body)
  (list 'if (string-match "dolby" (get-env-soft "HBARNOR_DEV_ROLES"))
        (cons 'progn body)))

(defmacro CentOS5Dev (&rest body)
  (list 'if (string-match "CentOS release 5" (shell-command-to-string "lsb_release -sd"))
        (cons 'progn body)))

(defmacro Google (&rest body)
  (list 'if (string-match "google" (get-env-soft "HBARNOR_DEV_ROLES"))
	(cons 'progn body)))

(provide 'hb-core)
;;; hb-core.el ends here
