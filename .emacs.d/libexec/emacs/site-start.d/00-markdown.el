; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
