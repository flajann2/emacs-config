;; LaTeX (alles)
;; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Shell script checking
(use-package flymake-shell
             :ensure t
             :config
                 (add-hook 'sh-set-shell-hook 'flymake-shell-load))

;; indent guide
(use-package indent-guide
             :ensure t
             :config
                (indent-guide-global-mode)
                (set-face-background 'indent-guide-face "dimgray"))

;; Python mode
(add-hook 'python-mode-hook
          (lambda () (setq forward-sexp-function nil)))

;; dir locals
(setq enable-dir-locals t)
(set-variable 'enable-local-variables ())

;; Grab my bash functions and aliases
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-lc")

;; screen shot attachments
(use-package org-attach-screenshot :ensure t)

;; turn off those pesky initialization warnings
(setq warning-minimum-level :emergency)

;; in addition, we might want to know what those
;; warnings were, so here is a function that can dump
;; them to the compile log.
(defun package-recompile-all()
  "Recompile all packages."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/elpa" 0 t))

;; iedit multiple regions substitute (c-;)
(use-package iedit :ensure t)

;; ediff character level
(setq-default ediff-forward-word-function 'forward-char)

;; Set tooltip-hide-delay to any desired duration
(setq tooltip-hide-delay 500.0) ;; seconds
(setq tooltip-delay 2.0)

;; Company Mode Configuration for completions FIXME
;;(Use-package company
;;  :ensure t
;;  :config
;;  (setq company-idle-delay 0.2)
;;  (setq company-minimum-prefix-length 1)
;;  (global-company-mode 1))

(provide 'miscellaneous)
;;; miscellaneous.el ends here
