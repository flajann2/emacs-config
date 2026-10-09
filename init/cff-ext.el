;;; -*- lexical-binding: t; -*-
;;;; we are using this for all things cpp

(use-package cmake-mode :ensure t)

;; cff -- find the other file (source <-> header).
;; Bound in both the classic cc-mode map and the tree-sitter map,
;; since treesit-auto remaps c/c++ buffers to c-ts-mode / c++-ts-mode.
(use-package cff
  :ensure t
  :commands cff-find-other-file
  :init
  (with-eval-after-load 'cc-mode
    (define-key c-mode-base-map (kbd "M-o") #'cff-find-other-file))
  (with-eval-after-load 'c-ts-mode
    (define-key c-ts-base-mode-map (kbd "M-o") #'cff-find-other-file)))

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
;; Hook both the classic and tree-sitter modes; treesit-auto means the
;; -ts- variants are what actually run when the grammars are installed.
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((c-mode      . lsp-deferred)
         (c++-mode    . lsp-deferred)
         (c-ts-mode   . lsp-deferred)
         (c++-ts-mode . lsp-deferred)
         (lsp-mode    . lsp-enable-which-key-integration))
  :config
  (setq lsp-clients-clangd-args '("-j=4"
                                  "--background-index"
                                  "--log=error"
                                  "--clang-tidy"
                                  "--enable-config"
                                  "--header-insertion=never"))
  (setq lsp-completion-enable-additional-text-edit nil
        lsp-idle-delay 0.1
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet t
        lsp-diagnostics-provider :flycheck))

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

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; we only do C++ (for now), and so ensure all defaults to C++.
;; treesit-auto remaps c++-mode -> c++-ts-mode when the grammar is
;; present, and falls back to c++-mode when it isn't.
(add-to-list 'auto-mode-alist '("\\.h\\'"    . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cppm\\'" . c++-mode))

;; Start LSP in every already-open C/C++ buffer that doesn't have it yet
;; (e.g. buffers restored by workgroups/desktop, or opened before this
;; file was loaded). lsp-deferred only connects once a buffer is shown,
;; so a pile of restored buffers won't all hit clangd at once.
(defun my/lsp-start-existing-cpp-buffers ()
  "Enable LSP in all live C/C++ buffers that are visiting files."
  (interactive)
  (let ((n 0))
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and buffer-file-name
                   (derived-mode-p 'c-mode 'c++-mode 'c-ts-mode 'c++-ts-mode)
                   (not (bound-and-true-p lsp-mode)))
          (lsp-deferred)
          (setq n (1+ n)))))
    (message "LSP queued for %d C/C++ buffer%s" n (if (= n 1) "" "s"))))

;; run once after startup, so restored sessions come up with LSP
(add-hook 'emacs-startup-hook #'my/lsp-start-existing-cpp-buffers)

;; manual: [pause] for the current buffer, C-[pause] for all open C/C++ buffers
(global-set-key [pause]   'lsp)
(global-set-key [C-pause] #'my/lsp-start-existing-cpp-buffers)

(provide 'cff-ext)
