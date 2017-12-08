; -*- mode: emacs-lisp; -*-
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-use-all-the-icons nil)
  (setq dired-sidebar-use-term-integration t))
