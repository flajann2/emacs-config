;;; go-ext.el --- Modern Go Development Setup (Emacs 29/30+)

;; 1. Treesit grammar management – pinned to a stable version
(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  ;; Pin Go grammar to a version known to work with go-ts-mode queries
  (setq treesit-language-source-alist
        '((go    . ("https://github.com/tree-sitter/tree-sitter-go" "v0.23.2"))
          (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod"))))
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

;; 2. Use Emacs *built-in* go-ts-mode (do NOT use the MELPA version)
;;    The MELPA go-ts-mode often ships the broken query.
(use-package eglot
  :ensure t
  :hook (go-ts-mode . eglot-ensure)
  :config
  (setq eglot-events-buffer-size 0)     ; no huge log buffer
  (setq eglot-autoshutdown t))

;; 3. Linting
(use-package flycheck
  :ensure t
  :hook (go-ts-mode . flycheck-mode))

(use-package flycheck-golangci-lint
  :ensure t
  :after flycheck
  :hook (go-ts-mode . flycheck-golangci-lint-setup))

;; 4. Completion
(use-package company
  :ensure t
  :hook (go-ts-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1))

;; 5. Old → new mode remapping
(add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))
(add-to-list 'major-mode-remap-alist '(go-mod-mode . go-mod-ts-mode))

(provide 'go-ext)
;;; go-ext.el ends here
