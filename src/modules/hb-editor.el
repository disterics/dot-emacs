;;; hb-editor.el --- Emacs Prelude: enhanced editing configuration.
;;
;; Copyright © 2011-2017 disterics
;;
;; Author: disterics <disterics@wojeshun.net>
;; URL: https://github.com/disterics/dot-emacs
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Refinements of the editing experience in Emacs.

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

;; enable and configure ws-butler to unobtrusively trim spaces

(prelude-require-packages '(ws-butler))

(require 'ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)

(provide 'hb-editor)

;;; hb-editor.el ends here
