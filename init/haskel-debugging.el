;;; haskell debugging - WIP

;; Haskell Debugging
;;; (require 'dap-mode)
;;; (require 'dap-haskell)
;;; (require 'dap-utils)
;;; 
;;; (dap-mode 1)
;;; (dap-ui-mode 1)
;;; (dap-tooltip-mode 1)
;;; (tooltip-mode 1)
;;; 
;;; (setq debug-on-error t)
;;; 
;;; (dap-register-debug-provider
;;;  "hda"lo
;;;  (lambda (conf)
;;;    (plist-put conf :dap-server-path (list "haskell-debug-adapter" "--hackage-version=0.0.31.0"))
;;;    conf))
;;; 
;;; (dap-register-debug-template "haskell-debug-adapter"
;;;                               (list :type "hda"
;;;                                     :request "launch"
;;;                                     :name "haskell-debug-adapter"
;;;                                     :workspace "./"
;;;                                     :startup "./app/Main.hs"
;;;                                     :ghciCmd "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show"
;;;                                     :logFile "logging.log"
;;;                                     :logLevel "WARNING"))

;; Repl setup code for Haskell.
;;; (use-package dante
;;;   :ensure t ; ask use-package to install the package
;;;   :after haskell-mode
;;;   :commands 'dante-mode
;;;   :init
;;;   ;; flycheck backend deprecated October 2022
;;;   ;; (add-hook 'haskell-mode-hook 'flycheck-mode)
;;; 
;;;   (add-hook 'haskell-mode-hook 'flymake-mode)
;;;   (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;;   (add-hook 'haskell-mode-hook 'dante-mode)
;;;   (add-hook 'haskell-mode-hook
;;;             (defun my-fix-hs-eldoc ()
;;;               (setq eldoc-documentation-strategy #'eldoc-documentation-default)))
;;;   :config
;;;   (require 'flymake-flycheck)
;;;   (defalias 'flymake-hlint
;;;     (flymake-flycheck-diagnostic-function-for 'haskell-hlint))
;;;   (add-to-list 'flymake-diagnostic-functions 'flymake-hlint)
;;;   ;; flycheck backend deprecated October 2022
;;;   ;; (flycheck-add-next-checker 'haskell-dante '(info . haskell-hlint)))

;; hasky stack integration
;; (global-set-key (kbd "<next>") nil)
;; (global-set-key (kbd "<f7> h e") #'hasky-stack-execute)
;; (global-set-key (kbd "<f7> h h") #'hasky-stack-package-action)
;; (global-set-key (kbd "<f7> h i") #'hasky-stack-new)

;;; (require 'haskell-mode)
;;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;; ;; (add-hook 'haskell-mode-hook 'linum-mode)
;;; ;; (add-hook 'haskell-mode-hook 'display-line-numbers-mode)
;;; (add-to-list 'exec-path "~/.local/bin")
;;; (eval-after-load 'haskell-mode '(progn
;;;   (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
;;;   (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
;;;   (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
;;;   (define-key haskell-mode-map "\C-ch" 'haskell-hoogle)))
;;; (eval-after-load 'haskell-cabal '(progn
;;;   (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
;;;   (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;;   (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(provide 'haskell-debugging)
