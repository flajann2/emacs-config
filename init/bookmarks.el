;; Bookmarks
(setq bm-restore-repository-on-load t)
(use-package bm
  :ensure t
  :config
  (global-set-key (kbd "<left-fringe> <mouse-8>") 'bm-next-mouse)
  (global-set-key (kbd "<left-fringe> <mouse-9>") 'bm-previous-mouse)
  (global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)
  ;; make bookmarks persistent as default
  (setq-default bm-buffer-persistence t))

;; TODO do hooks the right way
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)

(provide 'bookmarks)
