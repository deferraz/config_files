; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'magit)
  (package-install 'magit))
(global-set-key (kbd "C-x g") 'magit-status
