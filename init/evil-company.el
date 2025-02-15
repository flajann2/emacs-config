;; total evil lurks here.

;; prelude to evil
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Total evil. Toggle mode with c-z
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo))

;; evil org mode
(use-package evil-org
  :ensure t
  )

;; 

(provide 'evil-company)
