;; Org edit LaTeX
(use-package org-edit-latex
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (latex . t)   ;; <== add latex to the list
     (python . t)
     (shell . t)
     (ruby . t)
     (perl . t)
     (haskell . t)))

  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
                 '("org-plain-latex"
                   "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
  (setq org-latex-listings 't))

(provide 'org-latex)
