;; PaRTE Integration
(add-to-list 'load-path "/home/alveric/development/erlang_proj/stuff/parte_06_15/lib/erlang/lib/wrangler-1.1.01/elisp")
(use-package parte :ensure t)
(add-to-list 'load-path "/home/alveric/development/erlang_proj/stuff/parte_06_15/referl/tool/lib/referl_ui/emacs")
(use-package refactorerl :ensure t)

;; Please set the Erlang mode at first!!
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.7.2/emacs")
(use-package erlang-start :ensure t)

;; Elixir tools and the like
(use-package flymake-elixir :ensure t)
(add-hook 'elixir-mode-hook 'flymake-elixir-load)

(provide 'parte)
