;; Configuration of ORG Mode
(use-package org
  :ensure t
  :hook (org-mode . (lambda () (setq tab-width 8)))
  :config
  (setq org-list-demote-modify-bullet '(("+" . "→")))
  (setq org-hide-leading-stars t))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "◆" "◇" "✿"))
  )

;;; (use-package org-superstar
;;;   :ensure t
;;;   :config
;;;     ;; This is usually the default, but keep in mind it must be nil
;;;     (setq org-hide-leading-stars nil)
;;;     ;; This line is necessary.
;;;     (setq org-superstar-leading-bullet ?\s)
;;;     ;; If you use Org Indent you also need to add this, otherwise the
;;;     ;; above has no effect while Indent is enabled.
;;;     (setq org-indent-mode-turns-on-hiding-stars nil))

(provide 'org-ext)
