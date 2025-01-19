;; Haskell
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'hlint-refactor-mode)

(add-hook 'haskell-mode-hook 'intero-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-type 'cabal-repl)

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

;; Support for hlint
(require 'flymake-hlint)
(add-hook 'haskell-mode-hook 'flymake-hlint-load)

;; hasky stack integration
;; (global-set-key (kbd "<next>") nil)
;; (global-set-key (kbd "<f7> h e") #'hasky-stack-execute)
;; (global-set-key (kbd "<f7> h h") #'hasky-stack-package-action)
;; (global-set-key (kbd "<f7> h i") #'hasky-stack-new)

;; company ghci
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'linum-mode)
;; (add-hook 'haskell-mode-hook 'display-line-numbers-mode)
(add-to-list 'exec-path "~/.local/bin")
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map "\C-ch" 'haskell-hoogle)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-interactive-mode-hook 'company-mode)

;; comment evaluations -- >>>
(use-package haskell-mode
  :ensure t
  :config
  (require 'haskell-interactive-mode)
  (require 'haskell-process)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (setq haskell-process-type 'auto)
  (setq haskell-interactive-mode-eval-mode 'haskell-mode))

;; LSP and HLS
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(setq lsp-haskell-server-path "haskell-language-server-wrapper")

;; TODO the following may duplicate functionality
(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp))
(use-package lsp-haskell
  :ensure t)

;; path to ghci
(setenv "PATH" (concat (getenv "PATH") ":/opt/ghc/bin/"))
(setq exec-path (append exec-path '("/opt/ghc/bin/")))

;; lambda and arrow symbols
(global-prettify-symbols-mode 1)
(defun my-haskell-pretty-symbols ()
  "Set up pretty symbols for Haskell."
  (setq prettify-symbols-alist
        '(("lambda" . ?\u03BB)  ; λ
          ("\\" . ?\u03BB)      ; λ
          ("->" . ?\u2192)      ; →
          ("<-" . ?\u2190)      ; ←
          ("=>" . ?\u21D2)      ; ⇒
          ("map" . ?\u21A6)))    ; ↦
  (prettify-symbols-mode 1))

(add-hook 'haskell-mode-hook 'my-haskell-pretty-symbols)

(defun font-existsp (font)
  "Check to see if the named FONT is available."
  (if (null (x-list-fonts font))
	    nil t))

(require 'cl)
(defun font-avail (fonts)
  "Find the available FONTS."
  (remove-if-not 'font-existsp fonts))

(defvar font-preferences
  '("PragmataPro"
	  "Inconsolata"
		"DejaVu Sans Mono"
		"Bitstream Vera Sans Mono"
		"Anonymous Pro"
		"Menlo"
		"Consolas"))

(unless (eq window-system nil)
  (let ((fonts (font-avail font-preferences)))
    (unless (null fonts)
	    (set-face-attribute
		   'default nil :font
			 (car fonts)))))

;; Swiss Army Knife DSL
;; (add-to-list 'auto-mode-alist '("\\.sak\\'" . haskell-mode))

;; Haskell REPL
(defun my-cabal-repl ()
  "Launch cabal repl in 'ansi-term'."
  (interactive)
  (let ((default-directory (locate-dominating-file default-directory "cabal.project"))) ; Correct file name
    (if default-directory
        (progn
          (let ((term-buffer (ansi-term "/bin/fish")))  ; Start ansi-term and capture the buffer
            (with-current-buffer term-buffer
              ;; Wait for the terminal to be ready before sending commands
              (term-send-string (get-buffer-process term-buffer) "cabal repl\n")))
          )
      (message "No cabal.project found in parent directories."))))  ; Error message if not found

(global-set-key (kbd "C-c r") 'my-cabal-repl)

;; Haskell files (additional)
(add-to-list 'auto-mode-alist '("\\.hs-boot\\'" . haskell-mode))

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
(provide 'haskell-ext)
