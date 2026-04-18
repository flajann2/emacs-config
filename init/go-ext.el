;; go setup

(use-package go-projectile :ensure t)

;; flycheck
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;; go-eldoc
(use-package go-eldoc :ensure t)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; go-dlv
(use-package go-dlv :ensure t)

;; completion
(use-package go-complete :ensure t)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

;; direx
(use-package go-direx :ensure t)

;; guru
(use-package go-guru :ensure t)

;; lint
(add-to-list 'load-path "PATH CONTAINING golint.el" t)
(use-package golint :ensure t)

;; Treesit one-time setup
(setq treesit-language-source-alist
      '((go . "https://github.com/tree-sitter/tree-sitter-go")
        (gomod . "https://github.com/camdencheek/tree-sitter-go-mod")))

(treesit-install-language-grammar 'go)
(treesit-install-language-grammar 'gomod)

;; treesit setup
(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)  ; or t to auto-install
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

;; Optional: Remap go-mode to go-ts-mode everywhere
(add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))
(add-to-list 'major-mode-remap-alist '(go-mod-mode . go-mod-ts-mode))

;; LSP
(use-package eglot
  :hook (go-ts-mode . eglot-ensure))

(provide 'go-ext)
