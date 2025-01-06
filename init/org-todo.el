;; Org TODOs Keybindings
(global-set-key (kbd "C-;") 'ort/capture-todo)
(global-set-key (kbd "C-'") 'ort/capture-checkitem)
(global-set-key (kbd "C-`") 'ort/goto-todos)

(global-set-key (kbd "C-= t") 'org-time-stamp)

(defun org-snap-me ()
  "put me in org mode"
  (interactive)
  (treemacs-do-switch-workspace "Docler")
  (org-agenda))

(global-set-key (kbd "C-= a") 'org-snap-me)

;; Org timeline
(add-hook 'org-load-hook
  (lambda ()
    (setq org-agenda-custom-commands
   '(("L" "my view"
      ((todo
        "TODO"
        ((org-agenda-overriding-header "=== TODO tasks without scheduled date ===")
         (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
         (org-agenda-prefix-format '((todo . " %1c ")))))
       (agenda
        ""
        ((org-agenda-overriding-header "=== Scheduled tasks ===")
         (org-agenda-span 22)
         (org-agenda-prefix-format '((agenda . " %1c %?-12t% s")))))))))))

;; TODO Keyword sttes
(setq org-todo-keywords
      '((sequence "TODO(t)" "WORKING(w)" "REPORT(r)" "|" "DONE(d)")
        (sequence "|" "MOTHBALLED(m)")
        ))

;; Archive handling
(defadvice org-archive-subtree (around fix-hierarchy activate)
  (let* ((fix-archive-p (and (not current-prefix-arg)
                             (not (use-region-p))))
         (afile (org-extract-archive-file (org-get-local-archive-location)))
         (buffer (or (find-buffer-visiting afile) (find-file-noselect afile))))
    ad-do-it
    (when fix-archive-p
      (with-current-buffer buffer
        (goto-char (point-max))
        (while (org-up-heading-safe))
        (let* ((olpath (org-entry-get (point) "ARCHIVE_OLPATH"))
               (path (and olpath (split-string olpath "/")))
               (level 1)
               tree-text)
          (when olpath
            (org-mark-subtree)
            (setq tree-text (buffer-substring (region-beginning) (region-end)))
            (let (this-command) (org-cut-subtree))
            (goto-char (point-min))
            (save-restriction
              (widen)
              (-each path
                (lambda (heading)
                  (if (re-search-forward
                       (rx-to-string
                        `(: bol (repeat ,level "*") (1+ " ") ,heading)) nil t)
                      (org-narrow-to-subtree)
                    (goto-char (point-max))
                    (unless (looking-at "^")
                      (insert "\n"))
                    (insert (make-string level ?*)
                            " "
                            heading
                            "\n"))
                  (cl-incf level)))
              (widen)
              (org-end-of-subtree t t)
              (org-paste-subtree level tree-text))))))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("REPORT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("MOTHBALLED" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))
(setq-default org-export-with-todo-keywords nil)
(setq-default org-enforce-todo-dependencies t)

(provide 'org-todo)
