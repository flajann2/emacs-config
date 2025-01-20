;; Emacs Master Configuration

;; init graphical or command-line
(require 'init-ext)
(require 'elpaca-ext) ;; should be early to take out package.el
(require 'global-keys)
(require 'miscellaneous)
;; (require 'ruby-macros)
(require 'elixir-macros)
(require 'autosave-ext)
;; (require 'truncate-ext)
;; (require 'spelling-ext)
(require 'spelling-checker)
(require 'google-cstyle)
(require 'cff-ext)
(require 'lua-ext)

;; (require 'annoying-patches)
(require 'gdb-ext)

;; init auf graphical
(if (display-graphic-p)
    (progn
      ;; (require 'ecb-ext)
      (require 'treemacs-ext)
      (require 'line-numbers)
      (require 'highlighter)
      (require 'evil-company)
      (require 'header-cpp)
      (require 'org-ext)
      (require 'org-pub)
      (require 'org-todo)
      (require 'parens-ext)
      (require 'irc-ext)
      (require 'haskell-ext)
      (require 'ruby-ext)
      (require 'bookmarks)
      (require 'toc-ext)
      (require 'compilation-ext)
      ;; (require 'projectile-ext)
      ;; (require 'ext-go)
      ;; (require 'whitespace-cleanup)
      ;; (require 'ruby-electric)
      ;; (require 'spaces-ext)
      (require 'auto-dim-ext)
      (require 'folding-ext)
      ;; (require 'cmake-omnibus)
      ;; (require 'multiple-cursors)
      (require 'cppcheck-ext)
      (require 'clangtidy-ext)
      (require 'idle-hilight-ext) ;; idle hightlightuing
      (require 'ext-schlau)
      ;; (require 'tide-ext)
      ;; (require 'fish-setup)
      (require 'pretty)
      (require 'fish-ext)
      (require 'workgroups-ext)
      (require 'gptel-ext)
      (require 'window-layout-ext)
      ;; (require magit-ext)
      (require 'color-focus-ext)
      (require 'clipboard-ext)
      (require 'ellama-ext)
      (require 'typescript-ext)
      )
  )

(provide 'master-config)





