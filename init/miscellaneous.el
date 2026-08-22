;; LaTeX (alles)
;; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Shell script checking
(use-package flymake-shell
             :ensure t
             :config
                 (add-hook 'sh-set-shell-hook 'flymake-shell-load))

;; indent-bars substitutes for indent-guide
(unless (package-installed-p 'indent-bars)
  (let ((vc-handled-backends '(Git)))
    (package-vc-install '(indent-bars :url "https://github.com/jdtsmith/indent-bars" :rev :newest))))

(use-package indent-bars
  :hook (prog-mode . indent-bars-mode)
  ;; org-mode uses its own indentation semantics; opt in explicitly
  ;; if you want guides there too, otherwise leave it off
  :custom
  (indent-bars-treesit-support t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  ;; only draw guides where tree-sitter confirms real nesting,
  ;; avoids the kind of stale/ambiguous-position bugs indent-guide had
  (indent-bars-prefer-character nil)
  (indent-bars-color '(highlight :face-bg t :blend 0.15))
  (indent-bars-highlight-current-depth '(:blend 0.4))
  (indent-bars-display-on-blank-lines t))

;; Python mode
(add-hook 'python-mode-hook
          (lambda () (setq forward-sexp-function nil)))

;; dir locals
(setq enable-dir-locals t)
(set-variable 'enable-local-variables ())

;; Grab my bash functions and aliases
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-lc")

;; screen shot attachments
(use-package org-attach-screenshot :ensure t)

;; turn off those pesky initialization warnings
(setq warning-minimum-level :emergency)

;; in addition, we might want to know what those
;; warnings were, so here is a function that can dump
;; them to the compile log.
(defun package-recompile-all()
  "Recompile all packages."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/elpa" 0 t))

;; iedit multiple regions substitute (c-;)
(use-package iedit :ensure t)

;; ediff character level
(setq-default ediff-forward-word-function 'forward-char)

;; Set tooltip-hide-delay to any desired duration
(setq tooltip-hide-delay 500.0) ;; seconds
(setq tooltip-delay 2.0)

;; Company Mode Configuration for completions FIXME
;;(Use-package company
;;  :ensure t
;;  :config
;;  (setq company-idle-delay 0.2)
;;  (setq company-minimum-prefix-length 1)
;;  (global-company-mode 1))

;; update all packages with C-c u
(defun update-all-packages ()
  "Refresh and upgrade all packages."
  (interactive)
  (package-refresh-contents)
  (package-upgrade-all))

(global-set-key (kbd "C-c u") 'update-all-packages)

;;;###autoload
(defun my/lsp-shutdown-all ()
  "Shut down all LSP servers, regardless of client (eglot or lsp-mode)."
  (interactive)
  (cond
   ((featurep 'eglot)
    (when (fboundp 'eglot-shutdown-all)
      (eglot-shutdown-all)
      (message "eglot: all servers shut down")))
   ((featurep 'lsp-mode)
    (when (fboundp 'lsp-workspace-shutdown-all)
      (lsp-workspace-shutdown-all)
      (message "lsp-mode: all workspaces shut down")))
   (t
    (message "No LSP client (eglot or lsp-mode) detected as loaded")))
  ;; Belt-and-suspenders: kill any lingering LSP-related processes
  (dolist (proc (process-list))
    (let ((name (process-name proc)))
      (when (string-match-p "\\(lsp\\|eglot\\|hls\\|haskell-language-server\\)" name)
        (delete-process proc)))))

;; Optional keybinding
(global-set-key (kbd "C-c k") #'my/lsp-shutdown-all)

;;;; ;;;###autoload
;;;; ;; WIP
;;;; (defun my/lsp-restart-all-haskell ()
;;;;   "Start or restart LSP in all open Haskell-mode buffers."
;;;;   (interactive)
;;;;   (dolist (buf (buffer-list))
;;;;     (with-current-buffer buf
;;;;       (when (derived-mode-p 'haskell-mode 'haskell-literate-mode)
;;;;         (if (lsp-workspaces)
;;;;             (lsp-workspace-restart (car (lsp-workspaces)))
;;;;           (lsp))))))
;;;; 
;;;; ;;;###autoload
;;;; ;; WIP
;;;; (defun my/lsp-restart-all-haskell-p ()
;;;;   "Restart LSP in all open Haskell-mode buffers."
;;;;   (interactive)
;;;;   (dolist (buf (buffer-list))
;;;;     (with-current-buffer buf
;;;;       (when (derived-mode-p 'haskell-mode 'haskell-literate-mode)
;;;;         (when (bound-and-true-p lsp-mode)
;;;;           (lsp-workspace-restart (lsp--read-workspace)))))))

;;;###autoload
(defun my/lsp-start ()
  "Start LSP in the current buffer."
  (interactive)
  (lsp))

(global-set-key (kbd "C-c j") #'my/lsp-start)

(provide 'miscellaneous)
;;; miscellaneous.el ends here

