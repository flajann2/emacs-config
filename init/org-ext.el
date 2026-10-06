;;; -*- lexical-binding: t; -*-
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

(use-package org-tempo
  :ensure nil
  :after org
  :config
  (defface my-org-italic
    '((t :slant italic))
    "Italic face for Org emphasis.")
  (setf (nth 1 (assoc "/" org-emphasis-alist)) '(my-org-italic)))
(setq org-hide-emphasis-markers t)

;; Mermaid for block diagrams
(use-package ob-mermaid
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((mermaid . t))))
;; Optional: tell Emacs where mmdc is (usually not needed)
;; (setq ob-mermaid-cli-path "/usr/local/bin/mmdc")

;; ox-gfm needed for generation of md
;; orgmode outage in Github
(use-package ox-gfm
  :ensure t
  :after org)

(provide 'org-ext)
