;; elm integration
(use-package elm-mode
  :ensure t
  :hook  (elm-mode . elm-indent-simple-mode))
(provide 'elm-ext)
