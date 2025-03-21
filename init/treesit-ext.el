(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode)
  (treesit-auto-add-to-auto-mode-alist 'all)
  )

(provide 'treesit-ext)
