;; Treemacs configuration

;;; (require 'treemacs-evil)
;;; 
;;; (treemacs)
;;; (treemacs-follow-mode t)
;;; (treemacs-filewatch-mode t)
;;; (treemacs-fringe-indicator-mode 'always)
;;; (treemacs-git-mode 'extended)

;; Use package for treemacs
(use-package treemacs
  :ensure t
  :config
  (progn
    (treemacs)  ;; Open Treemacs
    (treemacs-follow-mode t)  ;; Enable following mode
    (treemacs-filewatch-mode t)  ;; Enable file watching mode
    (treemacs-fringe-indicator-mode 'always)  ;; Always show fringe indicators
    (treemacs-git-mode 'extended)))  ;; Set Git mode to extended

;; Use package for treemacs-evil integration
(use-package treemacs-evil
  :ensure t
  :after (treemacs evil))

(provide 'treemacs-ext)
