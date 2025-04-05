(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (treesit-font-lock-level 4)
  )

(provide 'treesit-ext)
