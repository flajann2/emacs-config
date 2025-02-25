;; Bookmarks
(setq bm-restore-repository-on-load t)
(use-package bm
  :ensure t

  :hook (after-save-hook   . bm-buffer-save)
  :hook (after-revert-hook . bm-buffer-restore)
  :hook (find-file-hooks   . bm-buffer-restore)
  :hook (kill-buffer-hook  . bm-buffer-save)
  :hook (kill-emacs-hook   . (lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
  :config
  (global-set-key (kbd "<left-fringe> <mouse-8>") 'bm-next-mouse)
  (global-set-key (kbd "<left-fringe> <mouse-9>") 'bm-previous-mouse)
  (global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)
  ;; make bookmarks persistent as default
  (setq-default bm-buffer-persistence t))

(provide 'bookmarks)
