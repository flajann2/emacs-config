;;; org-roam-ext --- Configuration

(use-package org-roam
             :ensure t
             :init
             (setq org-roam-v2-ack t)
             :custom
             (org-roam-directory "/development/emacs-config/roam-notes")
             :bind (("C-c n l"  . org-roam-buffer-toggle)
                    ("C-c n f"  . org-roam-node-find)
                    ("C-c n i"  . org-roam-node-insert)
                    :map org-mode-map
                    ("C-M-i"    . completion-at-point))
             :config
             (org-roam-setup))

(provide 'org-roam-ext)
;;;
