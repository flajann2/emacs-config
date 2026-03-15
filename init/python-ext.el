;; Python integration

;; ── Package bootstrap (MELPA) ────────────────────────────────────────────────
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; ── Tree-sitter: use python-ts-mode instead of python-mode ───────────────────
(use-package treesit
  :ensure nil   ; built-in
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode)))

;; Associate .toml files with toml-ts-mode
(add-to-list 'auto-mode-alist '("\\.toml\\'" . toml-ts-mode))

;; ── Eglot (built-in LSP client) ──────────────────────────────────────────────
(use-package eglot
  :ensure nil
  :hook (python-ts-mode . eglot-ensure)
  :config
  ;; Point eglot at pyright (or swap "pylsp" if you installed that instead)
  (add-to-list 'eglot-server-programs
               '(python-ts-mode . ("pyright-langserver" "--stdio")))
  ;; Optional: quieter eldoc, faster shutdown
  (setq eglot-autoshutdown t
        eglot-connect-timeout 30))

;; ── Completion UI (corfu — lightweight, works great with eglot) ──────────────
(use-package corfu
  :ensure t
  :hook (python-ts-mode . corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2))

;; ── Formatting on save via apheleia + ruff ───────────────────────────────────
(use-package apheleia
  :ensure t
  :hook (python-ts-mode . apheleia-mode)
  :config
  ;; Use ruff as formatter (or swap 'black if preferred)
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) 'ruff))

;; ── Linting via flymake (eglot activates it automatically) ───────────────────
;; Eglot drives flymake using pyright diagnostics — nothing extra needed.
;; If you want ruff as a standalone linter too:
(use-package flymake-ruff
  :ensure t
  :hook (python-ts-mode . flymake-ruff-load))

;; ── Virtual environment management ───────────────────────────────────────────
(use-package pyvenv
  :ensure t
  :hook (python-ts-mode . pyvenv-mode)
  :config
  ;; Auto-activate .venv in project root if present
  (pyvenv-tracking-mode 1))

;; ── DAP debugger (requires debugpy: pip install debugpy) ─────────────────────
(use-package dap-mode
  :ensure t
  :after eglot
  :hook (python-ts-mode . dap-mode)
  :config
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy))

;; ── REPL: send code to inferior Python ───────────────────────────────────────
;; Built-in — just bind the key you'll actually use
(use-package python
  :ensure nil
  :bind (:map python-ts-mode-map
         ("C-c C-c" . python-shell-send-dwim)   ; region or buffer
         ("C-c C-z" . python-shell-switch-to-shell)))

(provide 'python-ext)
