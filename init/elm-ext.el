;; elm integration
(use-package elm-mode
  :ensure t
  :config  (setq elm-mode-hook '(elm-indent-simple-mode)))
(provide 'elm-ext)
