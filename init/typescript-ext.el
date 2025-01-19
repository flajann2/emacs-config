;; Use package manager
(require 'package)
(setq package-list '(use-package typescript-mode eglot))

;; Initialize package sources
(package-initialize)

;; Install packages if not already installed
(dolist (pkg package-list)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

(use-package typescript-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))

(require 'eglot)

(add-to-list 'eglot-server-programs
             '(typescript-mode "typescript-language-server" "--stdio"))

(defun my-project-try-tsconfig-json (dir)
  (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
    (cons 'eglot-project found)))

(add-hook 'project-find-functions 'my-project-try-tsconfig-json nil nil)

(require 'tree-sitter)
(require 'tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'typescript-mode-hook #'tree-sitter-hl-mode)



(provide 'typescript-ext)
