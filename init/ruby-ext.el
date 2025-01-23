;; Ruby Debugging
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(defun my-run-remote-pry (&rest args)
  (interactive)
  (let ((buffer (apply 'make-comint "pry-remote" "pry-remote" nil args)))
    (switch-to-buffer buffer)
    (setq-local comint-process-echoes t)))
;; (define-key ruby-mode-map (kbd "C-c r d") 'my-run-remote-pry) ; (or whatever keybinding)

;; Ruby IDE
;; TODO: the next line smells up to the high heavens
(add-to-list 'load-path "~/.emacs.d/rinari")
(use-package rinari :ensure t)
(global-rinari-mode)
(use-package ido :ensure t)
(ido-mode t)

;; Ruby extensions
(add-hook 'ruby-mode-hook 'zossima-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'dired-mode-hook 'rspec-dired-mode)
(use-package bundler :ensure t)
;; (use-package helm-rb :ensure t)

;; Ruby reload method buffer based on clicking the thumbwheel!
(global-set-key [mouse-2] 'ecb-rebuild-methods-buffer)

(provide 'ruby-ext)
