;; go setup

(require 'go-projectile)

;; flycheck
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;; go-eldoc
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; go-dlv
(require 'go-dlv)

;; completion
(require 'go-complete)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

;; direx
(require 'go-direx)

;; guru
(require 'go-guru)

;; lint
(add-to-list 'load-path "PATH CONTAINING golint.el" t)
(require 'golint)

(provide 'ext-go)
