;; Add MELPA to the archives
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(setq vc-handled-backends nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(doom-outrun-electric))
 '(custom-safe-themes
   '("9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a"
     "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478"
     "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
     "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36"
     "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d"
     "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554"
     "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e"
     "5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5"
     "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522"
     "e978b5106d203ba61eda3242317feff219f257f6300bd9b952726faf4c5dee7b"
     "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176"
     "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af"
     "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40"
     "a68ec832444ed19b83703c829e60222c9cfad7186b7aea5fd794b79be54146e6"
     "82c23f84a483c38949b28d1097e8f98218ea69c46555ed9fef418f144005835c"
     "4e950f65f73de9695b558248570eb5d21cf6a7f2219446cefa3cc03d26c1cd44"
     default))
 '(flymake-cppcheck-enable "all")
 '(global-display-line-numbers-mode t)
 '(haskell-tags-on-save t)
 '(hl-highlight-background-colors
   '("firebrick" "Orange" "gold" "green1" "DeepSkyBlue1"
     "dark blue" "blue violet" "gray90" "gray60"
     "gray30" "cyan" "green4" "pale green" "deep pink"
     "hot pink" "saddle brown"))
 '(hl-highlight-foreground-colors
   '("snow" "snow" "black" "black" "snow" "snow" "snow"
     "black" "snow" "snow" "black" "black" "black"
     "blue" "black" "gray7"))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(package-hidden-regexps '("\\`let-alist"))
 '(package-selected-packages
   '(ace-flyspell adwaita-dark-theme
                  all-the-icons-nerd-fonts
                  auto-complete-clang-async
                  auto-save-buffers-enhanced bm
                  bracketed-paste buffer-move cff
                  clang-format cmake-mode company-ghci
                  corfu dap-mode doom-themes dune
                  dune-format elixir-mode ellama
                  elm-mode envrc fish-mode
                  flycheck-clang-analyzer
                  flycheck-haskell flycheck-ocaml
                  flymake-hlint flymake-json
                  flymake-python-pyflakes flymake-ruby
                  flymake-sass flymake-shell
                  flymake-yaml focus handlebars-mode
                  highlight-symbol hl-anything
                  idle-highlight-in-visible-buffers-mode
                  iedit indent-guide lsp-haskell lsp-ui
                  magit-lfs mic-paren multiple-cursors
                  mustache-mode ocaml-eglot ocp-indent
                  orderless org-attach-screenshot
                  org-bullets org-superstar origami
                  powerline purescript-mode smartparens
                  solaire-mode sublimity toc-org
                  treemacs-evil treesit-auto ts-comint
                  typescript-mode utop vertico-posframe
                  window-layout workgroups2 yafolding
                  yasnippet))
 '(python-guess-indent nil)
 '(python-indent 4)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(vc-follow-symlinks t)
 '(vc-suppress-confirm t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight regular :height 90 :width normal))))
 '(show-paren-match ((t (:background "medium blue" :weight bold)))))

;; add init files to the load path
(add-to-list 'load-path (expand-file-name "~/.config/emacs-config/init" user-emacs-directory))

;; load the master config to complete emacs's configuration
(require 'master-config)
