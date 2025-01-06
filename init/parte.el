;; PaRTE Integration
(add-to-list 'load-path "/home/alveric/development/erlang_proj/stuff/parte_06_15/lib/erlang/lib/wrangler-1.1.01/elisp")
(require 'parte)
(add-to-list 'load-path "/home/alveric/development/erlang_proj/stuff/parte_06_15/referl/tool/lib/referl_ui/emacs")
(require 'refactorerl)

;; Please set the Erlang mode at first!!
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.7.2/emacs")
(require 'erlang-start)

;; Elixir tools and the like
(require 'flymake-elixir)
(add-hook 'elixir-mode-hook 'flymake-elixir-load)

(provide 'parte)
