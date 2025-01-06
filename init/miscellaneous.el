;; Icicles Setup
(require 'icicles)
(icy-mode 1)

;; LaTeX (alles)
;; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Shell script checking
(require 'flymake-shell)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

;; indent guide
(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "dimgray")

;; Python mode
(add-hook 'python-mode-hook
          (lambda () (setq forward-sexp-function nil)))

;; Ansible
(require 'company-ansible)
(add-to-list 'company-backends 'company-ansible)

;; dir locals
(setq enable-dir-locals t)
(set-variable 'enable-local-variables ())

;; Grab my bash functions and aliases
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-lc")

;; C++ extra hilighting...
(modern-c++-font-lock-global-mode t)

;; screen shot attachments
(require 'org-attach-screenshot)

;; turn off those pesky initialization warnings
(setq warning-minimum-level :emergency)

;; in addition, we might want to know what those
;; warnings were, so here is a function that can dump
;; them to the compile log.
(defun package-recompile-all()
  "Recompile all packages."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/elpa" 0 t))

;; Orgmode TOC enable
(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-enable)
  (warn "toc-org not found"))

;; iedit multiple regions substitute (c-;)
(require 'iedit)

;; ediff character level
(setq-default ediff-forward-word-function 'forward-char)

;; Set tooltip-hide-delay to any desired duration
(setq tooltip-hide-delay 500.0) ;; seconds
(setq tooltip-delay 2.0)

;; Company Mode Configuration for completions
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (global-company-mode 1))

(provide 'miscellaneous)
;;; miscellaneous.el ends here
