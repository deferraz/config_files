; -*- mode: emacs-lisp; -*-
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq py-indent-offset 4)
	    (modify-syntax-entry ?_ "_")))
