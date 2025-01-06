;; cppcheck setup

(require 'flymake-cppcheck)
(add-hook 'c-mode-hook 'flymake-cppcheck-load)
(add-hook 'c++-mode-hook 'flymake-cppcheck-load)

(custom-set-variables
 '(flymake-cppcheck-enable "all"))

(provide 'cppcheck-ext)
