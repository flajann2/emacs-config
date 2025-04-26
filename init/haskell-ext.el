;; Haskell
;; TODO: Clean this beast up. Hooks, remove old comments, etc. 

;; set up Haskell mode
(use-package haskell-mode
  :ensure t
  ;; :hook (haskell-mode . font-lock-fontify-buffer)
  :hook (haskell-mode . turn-on-haskell-doc-mode)
  :hook (haskell-mode . turn-on-haskell-indentation)
  :hook (haskell-mode . hlint-refactor-mode) 
  :hook (haskell-mode . intero-mode)
  :hook (haskell-mode . interactive-haskell-mode)
  :hook (haskell-mode . flymake-haskell-enable)
  :init
  (add-to-list 'exec-path "~/.local/bin")
  :config
  (require 'haskell-interactive-mode)
  (require 'haskell-process)
  (setq haskell-process-type 'cabal-repl)
  (setq haskell-interactive-mode-eval-mode 'haskell-mode)
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-h") 'haskell-hoogle)
  (defun flymake-haskell-init ()
    "Flymake init function for Haskell."
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
           (local-file (file-relative-name temp-file (file-name-directory buffer-file-name))))
      (list "hlint" (list local-file))))

  (defun flymake-haskell-enable ()
    "Enable flymake mode for Haskell."
    (when (and buffer-file-name
               (file-writable-p (file-name-directory buffer-file-name))
               (file-writable-p buffer-file-name))
      (local-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
      (flymake-mode t)))

  (push '("\\.l?hs\\'" flymake-haskell-init) flymake-allowed-file-name-masks))

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
(use-package flymake-hlint
  :ensure t
  :hook (haskell-mode . flymake-hlint-load))

(use-package flymake-haskell-multi
  :ensure t
  :hook (haskell-mode . flymake-haskell-multi-load)
  :config
  (setq haskell-saved-check-command t))
  
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

;; company ghci
(use-package company-ghci
  :ensure t
  :hook (haskell-mode             . company-mode)
  :hook (haskell-interactive-mode . company-mode)
  :config
  (push 'company-ghci company-backends))

;; LSP and HLS
;; TODO the following may duplicate functionality
(use-package lsp-haskell :ensure t)

(use-package lsp-mode
  :ensure t
  :hook ((haskell-mode . lsp)
         (haskell-literate-mode-hook . lsp))
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

;;; (use-package lsp-ui
;;;   :ensure t
;;;   :hook (lsp-mode     . lsp-ui-mode)
;;;   :hook (haskell-mode . flycheck-mode)
;;;   ;; :hook (haskell-mode . lsp-haskell-enable)
;;;   )

;; (add-hook 'haskell-mode-hook #'lsp)
;; (add-hook 'haskell-literate-mode-hook #'lsp)

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
          ("map" . ?\u21A6)))   ; ↦
  (prettify-symbols-mode 1))

(add-hook 'haskell-mode-hook 'my-haskell-pretty-symbols) ; TODO Hook right

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

;; Hasktags -- uses the ghcup path
(let ((my-cabal-path (expand-file-name "~/.ghcup/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(custom-set-variables '(haskell-tags-on-save t))

(provide 'haskell-ext)
