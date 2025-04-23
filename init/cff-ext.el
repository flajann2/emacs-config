;;;; we are using this for all things cpp

(use-package cmake-mode :ensure t)

(use-package cff
  :ensure t
  ;; cff -- defines shortcut for find source/header file for the current file
  :hook ((c++-mode . (lambda ()
                       (define-key c-mode-base-map
                                   (kbd "M-o") 'cff-find-other-file)))
         (c-mode .   (lambda ()
                       (define-key c-mode-base-map
                                   (kbd "M-o") 'cff-find-other-file)))))

;; Auto-complete c++ headers FIXME
;;(use-package auto-complete :ensure t)
;;(use-package auto-complete-config :ensure t)
;;(ac-config-default)
;;(use-package auto-complete-c-headers :ensure t)
;;(add-to-list 'ac-sources 'ac-source-c-headers)

;; auto-dim
(add-hook 'after-init-hook (lambda ()
                             (when (fboundp 'auto-dim-other-buffers-mode)
                               (auto-dim-other-buffers-mode t))))

;; useful keybindings cribsheet
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; clangd and lsp
(use-package lsp-mode
  :ensure t
  :hook ((c++-mode . lsp-deferred)
         (c-mode   . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection '(:pipe ("clangd"
                             "-j=4"  ;; Use 4 threads
                             "--background-index"
                             "--log=error"
                             "--clang-tidy"
                             "--enable-config"))
    :major-modes '(c-mode c++-mode)
    :server-id 'clangd))
  ;; (setq lsp-prefer-flymake nil)
  )

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.3
        company-selection-wrap-around t
        company-tooltip-align-annotations t))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; FIXME
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  ;; :hook  (flycheck-mode . flycheck-clang-tidy-setup)
  )

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (setq lsp-idle-delay 0.1
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet t
        lsp-prefer-flymake nil))


;; we only do C++ (for now), and so ensure all defaults to C++
(add-to-list 'auto-mode-alist '("\\.h\\'"    . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'"  . c++-mode))

;; recognize cppm in c++ mode
(add-to-list 'auto-mode-alist '("\\.cppm\\'" . c++-mode))

(provide 'cff-ext)
