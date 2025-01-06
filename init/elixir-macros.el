;; elixir macros for pry

(use-package elixir-mode
  :ensure t)

(defun elixir-pry-debugging ()
  (fset 'epry [kp-home return up tab ?r ?e ?q ?u ?i ?r ?e ?  ?I ?E ?x ?\; ?  ?I ?E ?x ?. ?p ?r ?y ?  ?# ?D ?E ?B ?U ?G ?G ?I ?N ?G  tab kp-home])
  (fset 'eunpry [?\C-s ?# ?D ?E ?B ?U ?G ?G ?I ?N ?G kp-home ?\C-k ?\C-k])
  (local-set-key (kbd "C-c C-a") 'epry)
  (local-set-key (kbd "C-c a") 'eunpry)
  )

(add-hook 'elixir-mode-hook 'elixir-pry-debugging)
(add-hook
 'elixir-mode-hook
 (lambda ()
   (push '(">=" . ?\u2265) prettify-symbols-alist)
   (push '("<=" . ?\u2264) prettify-symbols-alist)
   (push '("!=" . ?\u2260) prettify-symbols-alist)
   (push '("==" . ?\u2A75) prettify-symbols-alist)
   (push '("=~" . ?\u2245) prettify-symbols-alist)
   (push '("<-" . ?\u2190) prettify-symbols-alist)
   (push '("->" . ?\u2192) prettify-symbols-alist)
   (push '("<-" . ?\u2190) prettify-symbols-alist)
   (push '("|>" . ?\u25B7) prettify-symbols-alist)))
   
(provide 'elixir-macros)
