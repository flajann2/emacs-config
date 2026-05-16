(use-package gptel
  :ensure t
  :config
  ;; Explicitly tell Emacs where your authinfo file is
  (setq auth-sources '("/development/privates/grok.authinfo"))

  ;; Create the xAI backend and force it to read from your auth file
  (setq gptel-backend
        (gptel-make-xai "xAI"
          :stream t
          :key #'gptel-api-key-from-auth-source))   ; This is the official helper

  ;; Set your preferred model
  (setq gptel-model 'grok-4)          ; or 'grok-4-mini for cheaper

  ;; Make this the default backend so it doesn't ask
  (setq gptel-default-backend (gptel-make-xai "xAI"))

  ;; Keybindings
  (global-set-key (kbd "C-c g") #'gptel)
  (global-set-key (kbd "C-c r") #'gptel-rewrite)
  )
(provide 'grok-ext)
