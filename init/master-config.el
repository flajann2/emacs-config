;; Emacs Master Configuration

(defun require-m (config)
  "require CONFIG and print a message."
  (message "*>>> config: %s" config)
  (require config))

;; init graphical or command-line
(require-m 'init-ext)
(require-m 'global-keys)
(require-m 'miscellaneous)
;; (require-m 'ruby-macros)
(require-m 'elixir-macros)
(require-m 'autosave-ext)
;; (require-m 'truncate-ext)
;; (require-m 'spelling-ext)
(require-m 'spelling-checker)
(require-m 'google-cstyle)
(require-m 'cff-ext)
(require-m 'lua-ext)

;; (require-m 'annoying-patches)
(require-m 'gdb-ext)

;; init auf graphical
(if (display-graphic-p)
    (progn
      (require-m 'treemacs-ext)
      (require-m 'line-numbers)
      (require-m 'highlighter)
      (require-m 'evil-company)
      ;; (require-m 'header-cpp)
      (require-m 'org-ext)
      (require-m 'org-pub)
      (require-m 'org-todo)
      (require-m 'org-toc-ext)
      (require-m 'parens-ext)
      (require-m 'irc-ext)
      (require-m 'haskell-ext)
      ;; (require-m 'ruby-ext) ;; something smells in this file
      (require-m 'bookmarks)
      (require-m 'compilation-ext)
      ;; (require-m 'projectile-ext)
      ;; (require-m 'go-ext)
      ;; (require-m 'whitespace-cleanup)
      ;; (require-m 'ruby-electric)
      ;; (require-m 'spaces-ext)
      (require-m 'auto-dim-ext)
      (require-m 'folding-ext)
      ;; (require-m 'cmake-omnibus)
      ;; (require-m 'multiple-cursors)
      ;; (require-m 'cppcheck-ext)
      (require-m 'clangtidy-ext)
      (require-m 'idle-hilight-ext) ;; idle hightlighting
      (require-m 'schlau-ext)
      ;; (require-m 'tide-ext)
      ;; (require-m 'fish-setup)
      (require-m 'pretty)
      (require-m 'fish-ext)
      (require-m 'workgroups-ext)
      ;; (require-m 'gptel-ext)
      (require-m 'window-layout-ext)
      (require-m 'magit-ext)
      (require-m 'color-focus-ext)
      (require-m 'clipboard-ext)
      ;; (require-m 'ellama-ext) ;; not loading properly FIXME
      ;; (require 'haskell-ihp)
      (message "*** LOADING INIT CONFIGS COMPLETE ***"))
  )

(provide 'master-config)

