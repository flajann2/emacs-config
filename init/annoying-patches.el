;; Some things are broken in the emacs 25.2
;; hopefully, these patches work!!!!

(defun display-buffer-at-bottom--display-buffer-at-bottom-around (orig-fun &rest args)
  "Bugfix for ECB: cannot use display-buffer-at-bottom', calldisplay-buffer-use-some-window' instead in ECB frame."
((insert )f (and ecb-minor-mode (equal (selected-frame) ecb-frame))
 (apply 'display-buffer-use-some-window args)
 (apply orig-fun args)))
(advice-add 'display-buffer-at-bottom :around #'display-buffer-at-bottom--display-buffer-at-bottom-around)

(provide 'annoying-patches)

