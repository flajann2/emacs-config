;;;; we are using this for all things cpp

(use-package cmake-mode :ensure t)

(use-package cff
             :ensure t
             :config
                ;;; cff -- defines shortcut for find source/header file for the current file
                ;; TODO set this hook up properly with use-package!
                (add-hook 'c++-mode-hook
                  '(lambda ()
                     (define-key c-mode-base-map (kbd "M-o") 'cff-find-other-file)))
                (add-hook 'c-mode-hook
                  '(lambda ()
                    (define-key c-mode-base-map (kbd "M-o") 'cff-find-other-file))))

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

;; Irony mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; clangd and lsp
(use-package lsp-mode
  :hook ((c++-mode . lsp)
         (c-mode . lsp))
  :commands lsp)

(use-package company
  :hook (after-init . global-company-mode))

;; FIXME
;;(use-package flycheck
;;  :init (global-flycheck-mode))
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (setq lsp-idle-delay 0.1
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet t
        lsp-prefer-flymake nil))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; we only do C++ (for now), and so ensure all defaults to C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

;; recognize cppm in c++ mode
(add-to-list 'auto-mode-alist '("\\.cppm\\'" . c++-mode))

(provide 'cff-ext)
