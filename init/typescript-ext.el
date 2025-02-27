;; Whaaaaa Typescript? Tell me it ain't so

(use-package typescript-mode
  :ensure t
  :config
  (use-package ts-comint
    :ensure t
    :hook (typescript-mode . (lambda ()
              (local-set-key (kbd "C-x C-e") 'ts-send-last-sexp)
              (local-set-key (kbd "C-M-x")   'ts-send-last-sexp-and-go)
              (local-set-key (kbd "C-c b")   'ts-send-buffer)
              (local-set-key (kbd "C-c C-b") 'ts-send-buffer-and-go)
              (local-set-key (kbd "C-c l")   'ts-load-file-and-go)))
    )
  )

;; The following appears to be broken. FIX
;; (use-package tss :ensure t)

(provide 'typescript-ext)
