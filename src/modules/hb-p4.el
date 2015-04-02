;;; hb-p4.el --- Emacs Prelude: Perforce support.
;;
;; Copyright © 2015-2015 disterics
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.2
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Load and configure support for perforce as a vcs.

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


(prelude-require-package 'p4)

(require 'p4)
(eval-after-load 'p4
  '(progn
     ;; ignore white spaces in p4 diff
     (setq p4-default-diff-options "-dub")))

(provide 'hb-p4)
;;; hb-p4.el ends here
