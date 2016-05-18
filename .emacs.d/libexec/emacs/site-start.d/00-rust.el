; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))
(unless (package-installed-p 'flycheck-rust)
  (package-install 'flycheck-rust)))
(setq racer-cmd "~/.cargo/bin/racer")
(setq racer-rust-src-path "~/project/rust/src") ;; Rust source code PATH
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
