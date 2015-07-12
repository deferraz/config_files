; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'jedi)
  (package-install 'jedi))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedit:setup-keys t)
(jedi:install-server)
