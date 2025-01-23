;; hl-anything
(use-package hl-anything
  :ensure t
  :config
  (hl-highlight-mode 1)
  (global-set-key [C-s-mouse-1] 'hl-highlight-thingatpt-local)
  (global-set-key [C-s-mouse-3] 'hl-highlight-thingatpt-global)
  (global-set-key [C-s-mouse-9] 'hl-find-next-thing)
  (global-set-key [C-s-mouse-8] 'hl-find-prev-thing))

(provide 'highlighter)
