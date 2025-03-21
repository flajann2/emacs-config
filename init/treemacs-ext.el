;; Treemacs configuration

(use-package treemacs
  :ensure t
  :config
    (treemacs)  ;; Open Treemacs

    ;; Ensure that treemacs uses nerd-icons or all-the-icons
    (use-package treemacs-all-the-icons-nerd-fonts
      :ensure t)
    
    (if (require 'treemacs-nerd-icons nil 'noerror)
        (treemacs-load-theme "nerd-icons")
      (if (require 'treemacs-all-the-icons-nerd-fonts nil 'noerror)
          (treemacs-load-theme "all-the-icons-nerd-fonts")))

    (treemacs-map-icons-with-auto-mode-alist
     '("CMakeLists.txt")
     `((cmake-mode . ,(treemacs-get-icon-value "cmake"))))

    ;; show git diffs to the remote repo 
    (setq treemacs-git-commit-diff-mode t)
    (treemacs-git-mode 'deferred)
    
    ;;(treemacs-follow-mode t)  ;; Enable following mode
    (treemacs-filewatch-mode t)  ;; Enable file watching mode
    (treemacs-fringe-indicator-mode 'always)  ;; Always show fringe indicators
    (treemacs-git-mode 'extended)  ;; Set Git mode to extended

    ;; Use package for treemacs-evil integration
    (use-package treemacs-evil
      :ensure t
      :after (treemacs evil)))


(provide 'treemacs-ext)
