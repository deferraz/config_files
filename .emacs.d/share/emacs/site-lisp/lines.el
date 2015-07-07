(defun editor-prepend-line (&optional arg)
  (interactive "P")
  (move-beginning-of-line arg)
  (open-line 1))

(defun editor-append-line (&optional arg)
  (interactive "P")
  (move-end-of-line arg)
  (open-line 1)
  (forward-line 1))

(provide 'lines)
