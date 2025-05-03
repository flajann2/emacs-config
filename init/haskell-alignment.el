;;; Haskell alignment -- line up comma lists, etc.

(use-package haskell-mode
  :ensure t
  :hook (haskell-mode . (lambda ()
                          (local-set-key (kbd "C-c :") 'align-haskell-record-fields)
                          (local-set-key (kbd "C-c =") 'align-haskell-initializers)
                          (local-set-key (kbd "C-c <") 'align-haskell-left-arrow)
                          (local-set-key (kbd "C-c >") 'align-haskell-right-arrow)
                          ))
  :config
  (defun align-haskell-record-fields ()
    "Align the fields in a Haskell record declaration."
    (interactive)
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)::" 1 1 nil))

  (defun align-haskell-initializers ()
    "Align the fields in a Haskell record declaration."
    (interactive)
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil))

  (defun align-haskell-left-arrow ()
    "Align the fields in a Haskell record declaration."
    (interactive)
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)<-" 1 1 nil))

  (defun align-haskell-right-arrow ()
    "Align the fields in a Haskell record declaration."
    (interactive)
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)->" 1 1 nil))
  )
  
(provide 'haskell-alignment)
