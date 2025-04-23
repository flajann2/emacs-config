;; files without an extention as c++ header
;; bacially, if they are located within a directory named 'include'

;; (defun file-in-directory-list-p (file dirlist)
;;   "Returns true if the file specified is contained within one of
;; the directories in the list. The directories must also exist."
;;   (let ((dirs (mapcar 'expand-file-name dirlist))
;;         (filedir (expand-file-name (file-name-directory file))))
;;     (and
;;      (file-directory-p filedir)
;;      (member-if (lambda (x) ; Check directory prefix matches
;;                   (string-match (substring x 0 (min(length filedir) (length x))) filedir))
;;                 dirs))))
;; 
;; (defun buffer-standard-include-p ()
;;   "Returns true if the current buffer is contained within one of
;; the directories in the INCLUDE environment variable."
;;   (and (getenv "INCLUDE")
;;        (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(defun buffer-is-in-include-dir-p ()
  "checks to see if buffer is nested inside a directory named 'include'
TODO: Note that this may break on Windows."
  (member "include" (split-string (expand-file-name buffer-file-name) "/"))
 )

(add-to-list 'magic-fallback-mode-alist '(buffer-is-in-include-dir-p . c++-mode))

(provide 'header-cpp)
