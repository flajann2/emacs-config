;; Autosave
(use-package auto-save-buffers-enhanced
             :ensure t
             :config
                (setq auto-save-buffers-enhanced-interval 1.0)
                (auto-save-buffers-enhanced t))

(provide 'autosave-ext)
