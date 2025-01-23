;; due to the way we like to layout our screen, comments in OrgMode, etc. should be
;; thusly. Use meta-q to format.
(setq-default fill-column 55)

;; buffer positions FIXME
;;(setq-default mode-line-format
;;              (list
;;               " "
;;               '(:eval (format "Char Position: %d" (point)))
;;               "  " ;; Add spacing
;;               ))

;; No pesky backup files
(setq make-backup-files nil)

;; No more annoying splash screen
(setq inhibit-splash-screen t)

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; (package-initialize)
;; (push 'company-robe company-backends)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Mustache
(add-to-list 'load-path "~/.emacs.d/vendor")
(use-package mustache-mode :ensure t)

;; Tabwidth in general
(setq tab-width 2)

;; Handlebars
(use-package handlebars-mode :ensure t)

;; Force tabs to be spaces
(add-hook 'after-change-major-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)
             (setq c-basic-indent 2)
             (setq tab-width 2)))

;; Sublimity
(use-package sublimity
             :ensure t
             :config
                (require 'sublimity-scroll)
                (require 'sublimity-map))

;; Bash FIXME
;;(use-package 'bash-completion)
;;(bash-completion-setup)

;; Auto modes
(setq auto-mode-alist
      (append
       '(
         ;; rake is ruby
         ("\\.rake\\'" . ruby-mode)
         ;; Powerplay is ruby
         ("\\.play\\'" . ruby-mode)
         ;; Fox DSL is ruby
         ("\\.fx\\'" . ruby-mode)
         ;; imap-filter is ruby
         ("\\.imap\\'" . ruby-mode)
         ;; RABL is ruby
         ("\\.rabl\\'" . ruby-mode)
         ;; opal is ruby
         ("\\.opal\\'" . ruby-mode)
         ;; jbuilder is ruby
         ("\\.jbuilder\\'" . ruby-mode)
         ;; Gemfile is ruby
         ("Gemfile\\'" . ruby-mode)
         ;; Capfile is ruby
         ("Capfile\\'" . ruby-mode)
         ;; Rakefile is ruby
         ("Rakefile\\'" . ruby-mode)
         ;; all is yaml
         ("all\\'" . yaml-mode)
         ;; .emacs is emacs-list
         ("\\.emacs\\'" . emacs-lisp-mode)
         )
       auto-mode-alist))

;; CEDET and gdb integration
(global-ede-mode 1)
(use-package semantic/sb)
(semantic-mode 1)
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t

 ;; auto rescan to fix ruby problem
 imenu-auto-rescan t
 )

;; diff-h1 FIXME
;;(global-diff-hl-mode)

;; flymake
(use-package flymake-ruby :ensure t)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(use-package flymake-sass :ensure t)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)

(use-package flymake-yaml :ensure t) ;; Not necessary if using ELPA package
(add-hook 'yaml-mode-hook 'flymake-yaml-load)

(use-package flymake-python-pyflakes :ensure t)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; Syntax checking
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
;; (add-hook 'flycheck-mode-hook 'flycheck-rust-setup) -- duplicate

;; JSON
(use-package flymake-json :ensure t)
(add-hook 'json-mode 'flymake-json-load)

;; Automatically reload changed files.
(global-auto-revert-mode t)
(setq auto-revert-verbose nil)

;; Goodbye annoying toolbar FIXME
;;(tool-bar-pop-up-mode 1)

;; grab the shell's path
;; (exec-path-from-shell-initialize)

;; Hilight Doxygen comments
;; (highlight-doxygen-global-mode 1)

;; bracketed paste
(use-package bracketed-paste :ensure t)
(bracketed-paste-enable)

;; assembly for C++ code at point
;; (use-package disaster)
;; (define-key c-mode-base-map (kbd "C-c d") 'disaster)

;; global launch FIXME
;;(global-launch-mode +1)

;; Pretty Org
;; (use-package 'org-superstar)
;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(provide 'init-ext)
