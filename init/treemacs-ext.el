;; Treemacs configuration

(use-package treemacs
  :ensure t
  :config
    (treemacs)  ;; Open Treemacs
    ;;(treemacs-follow-mode t)  ;; Enable following mode
    ;;(treemacs-filewatch-mode t)  ;; Enable file watching mode
    ;;(treemacs-fringe-indicator-mode 'always)  ;; Always show fringe indicators
    ;;(treemacs-git-mode 'extended)  ;; Set Git mode to extended
    )

;; Use package for treemacs-evil integration
(use-package treemacs-evil
  :ensure t
  :after (treemacs evil))

(provide 'treemacs-ext)
