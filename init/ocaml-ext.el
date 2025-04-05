;; ocaml

(use-package ocp-indent
  :ensure t
  :config
  (add-to-list 'load-path "~/.opam/default/share/emacs/site-lisp"))
(use-package dune :ensure t)
(use-package dune-format :ensure t)
(use-package flycheck-ocaml :ensure t)
(use-package ocaml-eglot :ensure t)
(use-package tuareg :ensure t)
(use-package utop :ensure t)

(provide 'ocaml-ext)
