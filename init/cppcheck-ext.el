;; cppcheck setup

(use-package flymake-cppcheck ;; TODO: flymake-cppcheck no longer available
  :ensure t
  :hook((c-mode   . flymake-cppcheck-load)
        (c++-mode .  flymake-cppcheck-load))
  :config
  (custom-set-variables
   '(flymake-cppcheck-enable "all")))

(provide 'cppcheck-ext)
