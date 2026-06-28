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
    :ensure t
    :config
    ;; Force italic face to actually use slant
    (set-face-attribute 'italic nil :slant 'italic)
    (set-face-attribute 'org-italic nil :slant 'italic)
    )

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

(provide 'org-ext)
