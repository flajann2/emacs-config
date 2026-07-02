;;; org-roam-ext --- Configuration

(use-package org-roam
  :ensure t
  :after org
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "/development/emacs-config/roam-notes")
  :bind (("C-c n l"  . org-roam-buffer-toggle)
         ("C-c n f"  . org-roam-node-find)
         ("C-c n i"  . org-roam-node-insert)
         ("C-c n c"  . org-roam-capture)
         :map org-mode-map
         ("C-M-i"    . completion-at-point))
  :config
  ;; === Dynamic Org Agenda with Org-roam ===
  (defun my/org-roam-list-notes-by-tag (tag-name)
    "Return list of files that have TAG-NAME."
    (mapcar #'org-roam-node-file
            (seq-filter
             (lambda (node)
               (member tag-name (org-roam-node-tags node)))
             (org-roam-node-list))))

  (defun my/org-roam-refresh-agenda-list ()
    "Refresh org-agenda-files from org-roam notes tagged with 'Project'."
    (interactive)
    (setq org-agenda-files
          (append
           ;; Your regular (non-roam) org files — edit these paths
           '("/development/emacs-config/org-agenda/inbox.org"
             "/development/emacs-config/org-agenda/projects.org"
             "/development/emacs-config/org-agenda/someday.org")
           ;; Roam notes tagged with "Project"
           (my/org-roam-list-notes-by-tag "Project"))))

  ;; Run once when Emacs starts
  (my/org-roam-refresh-agenda-list)

  ;; Optional: refresh automatically after creating a new roam note
  (advice-add 'org-roam-capture :after #'my/org-roam-refresh-agenda-list)

  ;; capture template
  (setq org-roam-capture-templates
        '(("p" "Project" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+tags: Project\n#+date: %U\n\n")
           :unnarrowed t
           :immediate-finish nil)
          
          ;; You can keep or add other templates below
          ("d" "Default note" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+date: %U\n\n")
           :unnarrowed t)))

  ;; final setup
  (setq org-agenda-files (org-roam-list-files))
  (org-roam-setup))

(provide 'org-roam-ext)
;;;
