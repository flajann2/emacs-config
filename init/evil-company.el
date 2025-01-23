;; total evil lurks here.

;; prelude to evil
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Total evil. Toggle mode with c-z
(use-package evil
  :ensure t
  :config (evil-mode 1))

(provide 'evil-company)
