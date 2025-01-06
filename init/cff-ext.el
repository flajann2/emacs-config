(require 'cff)
;;;; we are using this for all things cpp

;;; cff -- defines shortcut for find source/header file for the current file
(add-hook 'c++-mode-hook
          '(lambda ()
             (define-key c-mode-base-map (kbd "M-o") 'cff-find-other-file)))
(add-hook 'c-mode-hook
          '(lambda ()
             (define-key c-mode-base-map (kbd "M-o") 'cff-find-other-file)))



;; Auto-complete c++ headers
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)

;; auto-dim
(add-hook 'after-init-hook (lambda ()
                             (when (fboundp 'auto-dim-other-buffers-mode)
                               (auto-dim-other-buffers-mode t))))

;; Yasnippit
;;(require 'yasnippet)
(yas-global-mode 1)

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

(use-package flycheck
  :init (global-flycheck-mode))

(setq lsp-idle-delay 0.1
      lsp-enable-symbol-highlighting t
      lsp-enable-snippet t
      lsp-prefer-flymake nil)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; we only do C++ (for now), and so ensure all defaults to C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

;; recognize cppm in c++ mode
(add-to-list 'auto-mode-alist '("\\.cppm\\'" . c++-mode))

(provide 'cff-ext)
