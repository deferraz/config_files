; -*- mode: emacs-lisp; -*-
;;(unless (package-installed-p 'haskell-mode)
;;  (package-install 'haskell-mode))
(unless (package-installed-p 'intero)
  (package-install 'intero))
(add-hook 'haskell-mode-hook 'intero-mode)
