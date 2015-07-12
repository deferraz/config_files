; -*- mode: emacs-lisp; -*-
(defmacro with-system (type &rest body)
  "Evaluate body if `system-type' equals type."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(with-system gnu/linux
    (unless (package-installed-p 'spotify)
  (package-install 'spotify))

  (defun spotify-linux-command (command-name) "Execute command for Spotify" (interactive)
         (setq command-text (format "%s%s" "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player." command-name))
         (shell-command command-text))

  (defun spotify-toggle () "Play-Pause Spotify" (interactive)
         (spotify-linux-command "PlayPause"))

  (defun spotify-previous () "Starts the song over in Spotify" (interactive)
         (spotify-linux-command "Previous"))

  (defun spotify-next () "Next song in Spotify" (interactive)
         (spotify-linux-command "Next"))

  (global-set-key (kbd "<XF86AudioPrev>") 'spotify-previous)
  (global-set-key (kbd "<XF86AudioPlay>") 'spotify-toggle)
  (global-set-key (kbd "<XF86AudioNext>") 'spotify-next)
  (spotify-enable-song-notifications)
)
