;;; personal-keymap.el --- Define a personal keymap.
;;
;; Copyright © 2011-2015 distercs
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Defines a personal keymap that is uses the C-c p prefix.
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

(defvar personal-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "l") 'goto-line)
    (define-key map (kbd "r") 'replace-string)
    (define-key map (kbd "q") 'query-replace)
    map)
  "Personal keymap.")

(global-unset-key (kbd "C-x C-m"))
(global-set-key (kbd "C-c C-m") 'helm-M-x)

(global-unset-key (kbd "C-c p"))
(global-set-key (kbd "C-c p") personal-map)

(provide 'personal-keymap)
;;; personal-keymap.el ends here
