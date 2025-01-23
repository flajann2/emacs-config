;; cppcheck setup

(use-package flymake-cppcheck ;; TODO: flymake-cppcheck no longer available
  :ensure t
  :config
  (add-hook 'c-mode-hook 'flymake-cppcheck-load)
  (add-hook 'c++-mode-hook 'flymake-cppcheck-load) ; TODO hooks
  (custom-set-variables
   '(flymake-cppcheck-enable "all")))

(provide 'cppcheck-ext)
