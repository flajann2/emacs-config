;; To configure how dimmed buffers look like, customise
;; auto-dim-other-buffers-face.  This can be accomplished by:
;; 
;;     M-x customize-face RET auto-dim-other-buffers-face RET


(add-hook 'after-init-hook (lambda ()
                             (when (fboundp 'auto-dim-other-buffers-mode)
                               (auto-dim-other-buffers-mode t))))
(provide 'auto-dim-ext)
