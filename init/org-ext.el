;; Configuration of ORG Mode
(use-package org
  :ensure t
  :hook (org-mode . (lambda ()
                      (setq-local indent-tabs-mode t
                                  tab-width 8
                                  org-cycle-max-level 90)))
  :config
  (setq org-list-demote-modify-bullet '(("+" . "→")))
  (setq org-hide-leading-stars t))

(use-package org-superstar
  :ensure t
  :hook (org-mode . (lambda () (org-superstar-mode 1)))
  :config
    (setq org-hide-leading-stars nil)
    (setq org-superstar-leading-bullet ?\s)
    (setq org-indent-mode-turns-on-hiding-stars nil))

(provide 'org-ext)
