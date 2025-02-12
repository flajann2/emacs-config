;; generate table of contents
(use-package toc-org
  :ensure t
  :hook (org-mode . toc-org-enable)
  :config
    (add-to-list 'org-tag-alist '("TOC_5_gh" . ?T))
    (global-set-key (kbd "C-M-<tab>")  'toc-org-insert-toc))

;; prettyfy headers
(use-package org-superstar
  :ensure t
  :hook (org-mode . (lambda () (org-superstar-mode 1))))

(provide 'org-toc-ext)
