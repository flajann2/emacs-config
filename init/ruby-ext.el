;; Ruby Debugging
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(defun my-run-remote-pry (&rest args)
  (interactive)
  (let ((buffer (apply 'make-comint "pry-remote" "pry-remote" nil args)))
    (switch-to-buffer buffer)
    (setq-local comint-process-echoes t)))
;; (define-key ruby-mode-map (kbd "C-c r d") 'my-run-remote-pry) ; (or whatever keybinding)

;; Ruby IDE
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(global-rinari-mode)
(require 'ido)
(ido-mode t)

;; Ruby extensions
(add-hook 'ruby-mode-hook 'zossima-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'dired-mode-hook 'rspec-dired-mode)
(require 'bundler)
;; (require 'helm-rb)

;; Ruby reload method buffer based on clicking the thumbwheel!
(global-set-key [mouse-2] 'ecb-rebuild-methods-buffer)

(provide 'ruby-ext)
