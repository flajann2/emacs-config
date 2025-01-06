;; Generate a manifest
(with-temp-buffer
  (insert "(setq package-selected-packages '(")
  (dolist (pkg package-selected-packages)
    (insert (format "'%s " pkg)))
  (insert "))")
  (write-file "emacs-package-manifest.el"))
