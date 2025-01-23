(use-package toc-org
  :ensure t
  :hook (org-mode-hook . toc-org-enable)
  :config
    (add-to-list 'org-tag-alist '("TOC_5_gh" . ?T))
    (global-set-key [C-M-tab]  'toc-org-insert-toc))

(provide 'org-toc-ext)
