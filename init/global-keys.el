;; Highlight Symbol
(use-package highlight-symbol
  :ensure t
  :config
  (global-set-key [(control f3)] 'highlight-symbol-at-point)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [f2] 'highlight-symbol-prev))

;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Org to MD using pandoc
;; (global-set-key [mouse-10] 'org-pandoc-export-to-markdown)
;; (global-set-key [C-M-tab] 'org-pandoc-export-to-markdown)

;; Org export to LaTeX key bindings
;; (global-set-key (kbd "s-ö") 'org-latex-export-to-pdf)

;; Moving buffers around
(use-package buffer-move
  :ensure t
  :config
  (global-set-key (kbd "<C-S-up>")     'buf-move-up)
  (global-set-key (kbd "<C-S-down>")   'buf-move-down)
  (global-set-key (kbd "<C-S-left>")   'buf-move-left)
  (global-set-key (kbd "<C-S-right>")  'buf-move-right))

;; uppercase and lowercase
(global-set-key [C-S-mouse-9] 'upcase-word)
(global-set-key [C-S-mouse-8] 'downcase-word)

;; Multiple Cursors
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C-c C->")     'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-<")     'mc/mark-previous-like-this)
  (global-set-key (kbd "C-<")         'mc/mark-all-like-this))

;; Orgami
(use-package origami
  :ensure t
  :config
  (global-set-key (kbd "C-c C-f") 'origami-recursively-toggle-node)
  (global-set-key (kbd "C-c C-F") 'origami-show-only-node)
  (global-set-key (kbd "C-c C-u") 'origami-undo)
  (global-set-key (kbd "C-c C-r") 'origami-redo))

;; json-reformat-region key bindings
;;(global-set-key (kbd "C-.") 'json-reformat-region)
;;(global-set-key [mouse-8]   'json-reformat-region)

;; Window splitting and unsplitting the easy way
(global-set-key [mouse-8] 'split-window-vertically)
(global-set-key [mouse-9] 'split-window-horizontally)
(global-set-key [C-mouse-8] 'delete-window)
(global-set-key [C-mouse-9] 'kill-buffer)

;; and for you, menu bar... now use CTRL-LMB to pop it up.
(menu-bar-mode -99)

;; Blank Mode FIXME
;;; (use-package blank-mode :ensure t)
;;; (global-set-key [C-mouse-7] 'blank-mode)

;; Spell checking entire buffer
(global-set-key [f4] 'ispell-buffer)

;; experimental FIXME the hooks should work!!!!
(fset 'epry [kp-home return up tab ?r ?e ?q ?u ?i ?r ?e ?  ?I ?E ?x ?\; ?  ?I ?E ?x ?. ?p ?r ?y ?  ?# ?D ?E ?B ?U ?G ?G ?I ?N ?G  tab kp-home])
(fset 'eunpry [?\C-s ?# ?D ?E ?B ?U ?G ?G ?I ?N ?G kp-home ?\C-k ?\C-k])
;; (global-set-key (kbd "C-c C-a") 'epry)
;; (global-set-key (kbd "C-c a") 'eunpry)

;; clang-format
(use-package clang-format
  :ensure t
  :config
  (global-set-key (kbd "C-.") 'clang-format-buffer)
  (global-set-key (kbd "C-,") 'clang-format-region)
  (setq clang-format-style-option "file"))

;; minimap toggle
(global-set-key [?\s- ] 'minimap-mode)

;; line-wrap toggle
(global-set-key (kbd "C-#") 'visual-line-mode)

;; Full screen toggle (why do we have to add this???
(global-set-key [f11] 'toggle-frame-fullscreen)

;; Spell check the entire buffer
(global-set-key [f8] 'flyspell-buffer)

;; Scratch pop
(global-set-key (kbd "M-[") 'scratch-pop)

;; load-file
(global-set-key (kbd "C-c l") 'load-file)

;; restart the lanhguage server
(global-set-key (kbd "C-c w") 'lsp-restart-workspace)

;; font-lock-mode for syntax coloring
(global-set-key (kbd "C-c z") 'font-lock-fontify-buffer)

;; no more file dialogs, damnit!
;; (setq use-file-dialog nil)

(provide 'global-keys)
