;; go setup

(use-package go-projectile :ensure t)

;; flycheck
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;; go-eldoc
(use-package go-eldoc :ensure t)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; go-dlv
(use-package go-dlv :ensure t)

;; completion
(use-package go-complete :ensure t)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

;; direx
(use-package go-direx :ensure t)

;; guru
(use-package go-guru :ensure t)

;; lint
(add-to-list 'load-path "PATH CONTAINING golint.el" t)
(use-package golint :ensure t)

(provide 'go-ext)










