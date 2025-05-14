;;; haskell debugging - WIP

(use-package haskell-mode
  :ensure t
  :config
  (require 'haskell-interactive-mode)
  (require 'haskell-process)
  :hook
  (haskell-mode . interactive-haskell-mode)
  (haskell-mode . haskell-indentation-mode))

(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp)
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper"))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package flycheck
  :ensure t
  :hook (haskell-mode . flycheck-mode))

(use-package flycheck-haskell
  :ensure t
  :hook (flycheck-mode . flycheck-haskell-setup))

(use-package dape
  :ensure t
  :preface
  ;; By default dape shares the same keybinding prefix as `gud'
  ;; If you do not want to use any prefix, set it to nil.
  ;; (setq dape-key-prefix "\C-x\C-a")

  :hook
  ;; Save breakpoints on quit
  (kill-emacs . dape-breakpoint-save)

  ;; Load breakpoints on startup
  (after-init . dape-breakpoint-load)

  :config
  (setq dape-configs
        '(haskell-debug-adapter
          :modes (haskell-mode)
          :command "haskell-debug-adapter"
          :command-args ("--verbose --lsp")
          :type "haskell"
          :request "launch"
          :program "${file}"
          :stopOnEntry :json-false
          :logFile "/tmp/haskell-debug-adapter.log"
          :cwd "${workspaceFolder}"))
  
  ;; Turn on global bindings for setting breakpoints with mouse
  (dape-breakpoint-global-mode)

  ;; Info buffers to the right
  (setq dape-buffer-window-arrangement 'right)

  ;; Info buffers like gud (gdb-mi)
  (setq dape-buffer-window-arrangement 'gud)
  (setq dape-info-hide-mode-line nil)

  ;; Pulse source line (performance hit)
  ;; (add-hook 'dape-display-source-hook 'pulse-momentary-highlight-one-line)

  ;; Showing inlay hints
  (setq dape-inlay-hints t)

  ;; Save buffers on startup, useful for interpreted languages
  ;; (add-hook 'dape-start-hook (lambda () (save-some-buffers t t)))

  ;; Kill compile buffer on build success
  ;; (add-hook 'dape-compile-hook 'kill-buffer)

  ;; Projectile users
  ;; (setq dape-cwd-function 'projectile-project-root)

  ;; keybindings
  :bind
  (("M-<f1>"   . dape)
   ("M-<f2>"   . dape-quit)
   ("M-<f3>"   . dape-restart)
   ("M-<f4> p" . dape-pause)
   ("M-<f4> b" . dape-breakpoint-toggle)
   ("M-<f4> B" . dape-breakpoint-log)
   ("M-<f4> k" . dape-breakpoint-remove-all)
   ("M-<f4> K" . dape-breakpoint-remove)
   ("M-<f4> l" . dape-list-locals)
   ("M-<f4> w" . dape-watch-dwim)
   ("M-<f4> W" . dape-watch-remove)
   ("M-<f4> s" . dape-stack-select)
   ("M-<f4> t" . dape-threads)
   ("M-<f4> e" . dape-evaluate-expression)
   ("M-<f4> E" . dape-evaluate-region)
   ("M-<f5>"   . dape-continue)
   ("M-<f6>"   . dape-next)
   ("M-<f7>"   . dape-step-in)
   ("M-<S-f7>" . dape-step-out)
   ("M-<f8>"   . dape-toggle-breakpoint)))
  

;; Enable repeat mode for more ergonomic `dape' use
(use-package repeat
  :config
  (repeat-mode))

(provide 'haskell-debugging)
