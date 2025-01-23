;; Jekyll OrgMode Publishing
(use-package org
  :ensure t
  :config
  ;; ditaa for org mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ditaa . t)))
  ;; publishing for org mode
  (setq org-publish-project-alist
        '(("org"
           :base-directory "org/"
           :publishing-directory "org/"
           :section-numbers nil
           :with-toc nil
           :html-head "<link rel=\"stylesheet\"
                         href=\"../other/mystyle.css\"
                         type=\"text/css\"/>"))))

(provide 'org-pub)
