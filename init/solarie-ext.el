(use-package solaire-mode :ensure t)

;;Brighten buffers that represent real files:
(add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)

;; If you use auto-revert-mode:
(add-hook 'after-revert-hook #'turn-on-solaire-mode)

;; And to unconditionally brighten certain buffers:
(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)

;; You can do similar with the minibuffer when it is active:
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

(provide 'solarie-ext)
