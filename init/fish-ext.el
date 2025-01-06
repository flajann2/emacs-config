;; Fish shell setup

;; Use fish as the default shell
(setq explicit-shell-file-name "/usr/bin/fish")

(defvar my-term-shell "/usr/bin/fish")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; kill the buffer after close
(defun fish-term-exec-hook ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))
(add-hook 'term-exec-hook 'fish-term-exec-hook)

;; key binding
(global-set-key (kbd "s-<f1>") 'ansi-term)

(provide 'fish-ext)
