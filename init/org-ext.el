;; Configuration of ORG Mode
(use-package org
  :ensure t
  :config
  (setq org-hide-leading-stars t))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "◆" "◇" "✿")))

(provide 'org-ext)
