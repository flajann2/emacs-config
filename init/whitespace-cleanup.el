;; Whitespace cleanup
;; Since we auto-save, we no longer want this hook
;; (add-hook 'before-save-hook 'whitespace-cleanup)

(global-set-key (kbd "C-<tab>") 'whitespace-cleanup)

(provide 'whitespace-cleanup)
