;; Rubocop, the Ruby nag
(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)

(provide 'rubonag)
