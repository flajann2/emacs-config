(package-initialize)

(setq vc-handled-backends nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(hipster))
 '(custom-safe-themes
   '("1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" "545a4a02e2d043b7c81368723fcd7f4e271778cc3ca4a1498820a96948391ea3" "c2e3ed32bf334d893cb5c67616ec8b967eb3b00a93db810f97d93f6e22118c0b" default))
;;;;  '(display-line-numbers-type nil)
 '(flymake-cppcheck-enable "all")
 '(global-display-line-numbers-mode t)
 '(hl-highlight-background-colors
   '("firebrick" "Orange" "gold" "green1" "DeepSkyBlue1" "dark blue" "blue violet" "gray90" "gray60" "gray30" "cyan" "green4" "pale green" "deep pink" "hot pink" "saddle brown"))
 '(hl-highlight-foreground-colors
   '("snow" "snow" "black" "black" "snow" "snow" "snow" "black" "snow" "snow" "black" "black" "black" "blue" "black" "gray7"))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(org-agenda-files
   '("/development/byborg/Personal.org" "/development/byborg/IP-Dominance.org" "/development/byborg/corporate-docs/Trademarks/Trademarks.org" "/development/byborg/patents/PATENTS.org" "/development/byborg/NOTES.org" "/development/byborg/corporate-docs/WAG/WAG.org" "/development/byborg/README.org"))
 '(package-hidden-regexps '("\\`let-alist"))
 '(package-selected-packages
   '(irony shm face-shift ellama humanoid-themes magit-commit-mark magit-delta magit-file-icons magit-filenotify magit-lfs window-layout inf-elixir mix nix-env-install nixpkgs-fmt org-nix-shell nix-haskell-mode nix-modeline nix-ts-mode ob-nix pretty-sha-path gptel activities org-clock-agenda-daytime-mode coin-ticker company-solidity org-side-tree org2web workgroups2 evil-tex latex-pretty-symbols ob-latex-as-png org-elp preview-dvisvgm xenops evil evil-goggles goto-chg powerline powerline-evil python-mode lsp-haskell lsp-ui magit vterm-toggle vterm org-inline-pdf org-latex-impatient hasky-extensions hyai company-ghci ac-haskell-process flycheck-haskell flymake-hlint ghc-imported-from haskell-emacs haskell-emacs-base haskell-emacs-text hasky-stack dante csv-mode scratch-pop calfw-org idle-org-agenda fish-completion fish-mode slime slime-company slime-repl-ansi-color sotlisp helm-ispell flyspell-correct-popup spell-fu auto-indent-mode lua-mode auto-complete-auctex launch launch-mode bracketed-paste xml+ lsp-javacomp thread-dump tide ts-comint gnus-desktop-notify gnu-elpa-keyring-update qml-mode typescript-mode highlight-doxygen organize-imports-java spinner auto-rename-tag helm-jstack java-imports jdecomp jdee jtags lsp-clangd lsp-elixir lsp-go lsp-java lsp-mode lsp-python realgud-jdb x-path-walker flycheck-kotlin kotlin-mode flymake-go flycheck-demjsonlint json-mode flycheck-golangci-lint go-complete go-direx go-dlv go-eldoc go-errcheck go-fill-struct go-guru go-imenu go-impl go-playground go-playground-cli go-projectile go-scratch golint gore-mode gorepl-mode org-projectile hl-anything nix-buffer nix-mode nix-sandbox nix-update iedit idle-highlight-in-visible-buffers-mode yasnippet-classic-snippets auto-auto-indent auto-complete-clang flycheck-clang-analyzer flycheck-clang-tidy flymake-haskell-multi ac-ispell auto-complete-clang-async cmake-project cpputils-cmake modern-cpp-font-lock org-attach-screenshot org-noter org-sync yafolding org-link-minor-mode clang-format latex-extra latex-math-preview latex-preview-pane magic-latex-buffer ninja-mode px timesheet origami auto-dim-other-buffers cff cheat-sh cuda-mode flymake-google-cpplint org-web-tools s zossima yard-mode yaml-tomato yaml-mode web-beautify tool-bar+ toml-mode toc-org sublimity stack-mode smartparens smart-shift smart-compile slack shell-command scss-mode sass-mode rust-playground ruby-tools ruby-refactor ruby-interpolation ruby-guard ruby-end ruby-electric ruby-dev ruby-block ruby-additional rubocop rspec-mode robe rinari realgud rbenv racer python paren-completer ox-pandoc ox-mediawiki ox-html5slide orgtbl-ascii-plot org2jekyll org-webpage org-wc org-table-comment org-repo-todo org-readme org-pdfview org-page org-jira org-jekyll org-gcal org-fstree org-ehtml org-edit-latex org-easy-img-insert org-download org-dashboard org-commentary org-cliplink org-caldav org-bullets org-beautify-theme org-autolist org-agenda-property org-ac ob-rust ob-elixir noxml-fold nhexl-mode multi-compile motion-mode mkdown miniedit mic-paren mc-extras markdown-toc markdown-mode+ list-utils json-reformat javap-mode javaimp javadoc-lookup java-snippets jabber indent-guide imenu+ ido-completing-read+ icicles html-to-markdown hlint-refactor hl-todo hipster-theme highlight-symbol highlight-parentheses highlight-defined hi2 helm-rubygems-org helm-rb helm-rails helm-google helm-ag gitignore-mode git-timemachine git-rebase-mode git-gutter git-dwim git-commit-mode git-blame git-auto-commit-mode german-holidays fullscreen-mode frame-restore fold-this fold-dwim flyspell-popup flyspell-lazy flymake-yaml flymake-shell flymake-sass flymake-rust flymake-ruby flymake-python-pyflakes flymake-json flymake-haml flymake-cppcheck flycheck-package flycheck-mix flycheck-dialyxir flycheck-credo flycheck-color-mode-line eproject epresent enh-ruby-mode elmacro el-spec edts ecb ebal dockerfile-mode dkdo discover-my-major diff-hl dictcc company-inf-ruby company-ghc company-ansible cmake-ide cmake-font-lock centimacro cdlatex cargo bundler buffer-move browse-at-remote bog bm blank-mode bash-completion autopair autodisass-java-bytecode auto-save-buffers-enhanced auto-overlays auto-org-md auto-complete-nxml auto-complete-c-headers auto-compile auctex-latexmk apib-mode anything-git-grep anything-git-files ant ansible annotate angularjs-mode angular-snippets android-mode ample-theme alchemist ag adjust-parens ace-flyspell ac-math))
 '(python-guess-indent nil)
 '(python-indent 4)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(speedbar-show-unknown-files t)
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
(add-to-list 'load-path (expand-file-name "/development/emacs-config/init" user-emacs-directory))

;; load the master config to complete emacs's configuration
(require 'master-config)
