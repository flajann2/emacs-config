(use-package solaire-mode
  :ensure t
  :hook (after-change-major-mode-hook . turn-on-solaire-mode)
  :hook (after-revert-hook . turn-on-solaire-mode)
  :hook (minibuffer-setup-hook . solaire-mode-in-minibuffer)
  :config
  '(push '(treemacs-window-background-face . solaire-default-face) solaire-mode)
  '(push '(treemacs-hl-line-face           . solaire-hl-line-face) solaire-mode)
  )


(provide 'solarie-ext)
