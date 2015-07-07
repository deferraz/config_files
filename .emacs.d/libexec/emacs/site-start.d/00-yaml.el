; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
