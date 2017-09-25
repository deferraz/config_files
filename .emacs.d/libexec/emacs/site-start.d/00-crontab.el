; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'crontab-mode)
  (package-install 'crontab-mode))
(add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))
