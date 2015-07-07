; -*- mode: emacs-lisp; -*-
(require 'package)
(require 'server)

(setq inhibit-splash-screen t)
(when (>= emacs-major-version 24)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (when (not package-archive-contents) (package-refresh-contents)))

(unless (boundp 'user-emacs-directory)
  (setq user-emacs-directory "~/.emacs.d/"))

(let ((user-site-lisp-dir (concat user-emacs-directory "share/emacs/site-lisp/"))
      (user-theme-dir (concat user-emacs-directory "themes/"))
      (user-site-start-dir (concat user-emacs-directory "libexec/emacs/site-start.d/")))
  (add-to-list 'custom-theme-load-path user-theme-dir)
  (let ((default-directory user-site-lisp-dir))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path))
  (mapcar 'load (file-expand-wildcards (concat user-site-start-dir "*.el"))))

(fset 'yes-or-no-p 'y-or-n-p)


(load-theme 'monokai t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))


;; No bar and toolbar!
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; kill whole line
(setq kill-whole-line t)
(global-set-key (kbd "C-k") 'kill-whole-line)

;; Visual Bell
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(setq backup-inhibited t)
					; Server Mode
(unless (server-running-p) (server-start))
