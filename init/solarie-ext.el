(use-package solaire-mode
  :ensure t
  :hook (after-change-major-mode . turn-on-solaire-mode)
  :hook (after-revert            . turn-on-solaire-mode)
  :hook (minibuffer-setup        . solaire-mode-in-minibuffer)
  :config
  '(push '(treemacs-window-background-face . solaire-default-face) solaire-mode)
  '(push '(treemacs-hl-line-face           . solaire-hl-line-face) solaire-mode)
  )


(provide 'solarie-ext)
