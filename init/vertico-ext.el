(use-package vertico-posframe
  :ensure t
  :config
  (vertico-posframe-mode 1)
  (setq vertico-multiform-commands
        '((consult-line
           posframe
           (vertico-posframe-poshandler . posframe-poshandler-frame-top-center)
           (vertico-posframe-border-width . 10)
           ;; NOTE: This is useful when emacs is used in both in X and
           ;; terminal, for posframe do not work well in terminal, so
           ;; vertico-buffer-mode will be used as fallback at the
           ;; moment.
           (vertico-posframe-fallback-mode . vertico-buffer-mode))
          (t posframe)))
  (vertico-multiform-mode 1)
  (setq vertico-posframe-parameters
        '((left-fringe . 8)
          (right-fringe . 8))))

(provide 'vertico-ext)
