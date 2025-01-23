;; Rubocop, the Ruby nag
(use-package rubocop :ensure t)
(add-hook 'ruby-mode-hook #'rubocop-mode)

(provide 'rubonag)
