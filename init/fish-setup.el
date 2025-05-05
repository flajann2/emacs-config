;; setup for fish as the shell as well as fish-mode
(use-package fish-mode
  :ensure t
  :hook (fish-mode . (lambda () (add-hook 'before-save-hook 'fish_indent-before-save)))
  )

(setq-default explicit-shell-file-name "/usr/bin/fish")
(setq-default shell-file-name "/usr/bin/fish")

(provide 'fish-setup)
