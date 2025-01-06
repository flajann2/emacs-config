(require 'toc-org)

;; toc-org enablization Cc Cq T inserts toc
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-enable)
  (warn "toc-org not found"))
(add-to-list 'org-tag-alist '("TOC_5_gh" . ?T))
;; (global-set-key [mouse-10] 'toc-org-insert-toc)
(global-set-key [C-M-tab]  'toc-org-insert-toc)

(provide 'toc-ext)
