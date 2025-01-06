;; Treemacs configuration

(require 'treemacs-evil)

(treemacs)
(treemacs-follow-mode t)
(treemacs-filewatch-mode t)
(treemacs-fringe-indicator-mode 'always)
(treemacs-git-mode 'extended)

(provide 'treemacs-ext)
