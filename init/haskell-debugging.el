;;; haskell debugging - WIP

;; haskell-mode setup (interactive-haskell-mode, indentation, requires)
;; lives in haskell-ext.el — not duplicated here.

(use-package lsp-mode
  :ensure t
  :custom
  ;; replaces the obsolete `lsp-prefer-flymake nil'
  (lsp-diagnostics-provider :flycheck))

(use-package lsp-haskell
  :ensure t
  :after lsp-mode)

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
  :hook
  ((kill-emacs . dape-breakpoint-save)   ; save breakpoints on quit
   (after-init . dape-breakpoint-load))  ; load breakpoints on startup
  :config
  ;; Add to dape's built-in configs rather than replacing them.
  ;; Needs `haskell-debug-adapter' and `ghci-dap' installed.
  (add-to-list 'dape-configs
               `(haskell-debug-adapter
                 modes (haskell-mode haskell-ts-mode)
                 command "haskell-debug-adapter"
                 :type "ghc"
                 :request "launch"
                 :workspace dape-cwd
                 :startup dape-buffer-default
                 :stopOnEntry nil
                 :ghciPrompt "H>>= "
                 :ghciInitialPrompt "> "
                 :ghciCmd "cabal repl -w ghci-dap --repl-no-load"
                 :logFile "/tmp/haskell-debug-adapter.log"
                 :logLevel "WARNING"))

  (dape-breakpoint-global-mode)          ; mouse breakpoints in the fringe
  (setq dape-buffer-window-arrangement 'gud
        dape-info-hide-mode-line nil
        dape-inlay-hints t)
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
   ("M-<f8>"   . dape-breakpoint-toggle)))

;; Enable repeat mode for more ergonomic `dape' use
(use-package repeat
  :ensure nil
  :config
  (repeat-mode))

(provide 'haskell-debugging)
