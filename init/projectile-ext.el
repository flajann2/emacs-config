;; org projectile

;; FIXME -- this is buggy on laptop!

;;(require 'org-projectile)
;;(setq org-projectile-projects-file
;;      "/your/path/to/an/org/file/for/storing/project/todos.org")
;;(push (org-projectile-project-todo-entry) org-capture-templates)
;;(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;(global-set-key (kbd "C-c c") 'org-capture)
;;(global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (setq org-projectile-per-project-filepath "todos.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates))
  :ensure t)

(provide 'projectile)
