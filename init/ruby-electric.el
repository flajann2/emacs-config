;; Ruby electric (we may yank this if too annoying)
;; Type M-x customize-group ruby-electric for configuration.
(eval-after-load "ruby-mode"
  '(add-hook 'ruby-mode-hook 'ruby-electric-mode))

(provide 'ruby-electric)
