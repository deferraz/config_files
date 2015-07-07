; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'linum-relative)
  (package-install 'linum-relative))
(require 'linum-relative)
(global-linum-mode t)
;; linenum width hack
(set-face-attribute 'linum nil :height 100)
