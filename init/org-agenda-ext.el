;;; org-agenda-ext.el --- Personal Org Agenda Custom Commands -*- lexical-binding: t; -*-

;; Commentary:
;; Custom agenda views for my projects.
;; Feel free to extend this as needed.

;;; Code:
(setq org-agenda-custom-commands
      '(("n" "Test"
         ((alltodo "")))))

;;;; (setq org-agenda-custom-commands
;;;;       '(("n" "Next Wave of Success"
;;;;          ((tags-todo "+NextWave")))))
;;;; ;; ------------------------------------------------------------------
;;;; ;; Global agenda files (set this once)
;;;; ;; ------------------------------------------------------------------
;;;; (setq org-agenda-files
;;;;       '("/development/dangerous-ideas/oma/nextwave.org"))
;;;; 
;;;; ;; ------------------------------------------------------------------
;;;; ;; Custom agenda commands
;;;; ;; ------------------------------------------------------------------
;;;; (setq org-agenda-custom-commands
;;;;       '(("n" "Next Wave of Success"
;;;;          ((tags-todo "+NextWave"
;;;;                      ((org-agenda-overriding-header "Next Wave of Success")))))))

(provide 'org-agenda-ext)
;;; org-agenda-ext.el ends here
