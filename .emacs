; -*- mode: emacs-lisp; -*-
(require 'package)
(require 'server)
(require 'ido)

(setq inhibit-splash-screen t)
(when (>= emacs-major-version 24)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (when (not package-archive-contents) (package-refresh-contents)))

(unless (boundp 'user-emacs-directory)
  (setq user-emacs-directory "~/.emacs.d/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package exec-path-from-shell
	     :config
	     (when (memq window-system '(mac ns x))
	       (exec-path-from-shell-initialize)))

(let ((user-site-lisp-dir (concat user-emacs-directory "share/emacs/site-lisp/"))
      (user-theme-dir (concat user-emacs-directory "themes/"))
      (user-site-start-dir (concat user-emacs-directory "libexec/emacs/site-start.d/")))
  (add-to-list 'custom-theme-load-path user-theme-dir)
  (let ((default-directory user-site-lisp-dir))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path))
  (mapcar 'load (file-expand-wildcards (concat user-site-start-dir "*.el"))))

(use-package try
	     :ensure t)
(use-package which-key
	     :ensure t
	     :config
	     (which-key-mode))

(require 'lines)
(global-hl-line-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
;; Save whatever’s in the current (system) clipboard before
;; replacing it with the Emacs’ text.
;; https://github.com/dakrone/eos/blob/master/eos.org
(setq save-interprogram-paste-before-kill t)
;; Flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))


(load-theme 'monokai t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Mononoki" :foundry "unknown" :slant normal :weight normal :height 133 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

;; Ido Mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)

;; No bar and toolbar!
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; kill whole line
(setq kill-whole-line t)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-o") 'editor-append-line)
(global-set-key (kbd "C-S-o") 'editor-prepend-line)

;; Visual Bell
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(setq backup-inhibited t)

(add-hook 'before-save-hook
	  (lambda ()
	    (when (not (or (derived-mode-p 'markdown-mode) (derived-mode-p 'crontab-mode)))
	      (delete-trailing-whitespace))))
;; Use dump jump for jump to definition https://github.com/jacktasia/dumb-jump
(unless (package-installed-p 'dumb-jump)
  (package-install 'dumb-jump))
(dumb-jump-mode)

;; Server Mode
(unless (server-running-p) (server-start))
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel org-bullets yaml-mode which-key use-package try slime rust-mode powerline php-mode monokai-theme markdown-mode magit linum-relative js2-mode intero go-mode flycheck-rust dumb-jump dired+ debian-changelog-mode clojure-mode auto-complete ace-window ace-jump-mode))))
