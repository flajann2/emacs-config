;; Only put in here what needs to be configured last.

;; Because we actually like syntax coloring
(global-font-lock-mode 1)

;;; ;; fixes a bug with font-lock starting properly for C++, C, Java, etc. CC-mode
;;; (add-hook 'c-mode-common-hook #'font-lock-fontify-buffer)
;;; 
;;; ;; fixes the bug for Haskell
;;; (add-hook 'haskell-mode-hook #'font-lock-fontify-buffer)

(add-hook 'prog-mode-hook #'font-lock-fontify-buffer)
(provide 'last-config)
