;; What? Scala too?

(use-package scala-mode
  :ensure t
  :interpreter ("scala" . scala-mode))

(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false")))

(use-package lsp-mode
  :ensure t
  :hook (scala-mode . lsp)
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t)

(use-package company-lsp
  :ensure t)

(use-package lsp-metals
  :ensure t)

(use-package company
  :ensure t
  :hook (scala-mode . company-mode)
  :config
  (setq company-idle-delay 0.3)
  (setq company-minimum-prefix-length 1))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(provide 'scala-ext)
