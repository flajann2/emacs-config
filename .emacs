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
 '(custom-enabled-themes '(hipster))
 '(custom-safe-themes
   '("4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84"
     "3d21eda97ce916fda054b0d2e1381e3fb3118cee79749e4b282b55fc461fb13e"
     "1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345"
     "545a4a02e2d043b7c81368723fcd7f4e271778cc3ca4a1498820a96948391ea3"
     "c2e3ed32bf334d893cb5c67616ec8b967eb3b00a93db810f97d93f6e22118c0b"
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
   '(ac-haskell-process ac-ispell ac-math ace-flyspell
                        activities adjust-parens ag
                        alchemist
                        all-the-icons-nerd-fonts
                        ample-theme android-mode
                        angular-snippets angularjs-mode
                        annotate ansible ant
                        anything-git-files
                        anything-git-grep apib-mode
                        auctex auctex-label-numbers
                        auctex-latexmk auto-auto-indent
                        auto-compile
                        auto-complete-auctex
                        auto-complete-c-headers
                        auto-complete-clang
                        auto-complete-clang-async
                        auto-complete-nxml
                        auto-dim-other-buffers
                        auto-indent-mode auto-org-md
                        auto-overlays auto-rename-tag
                        auto-save-buffers-enhanced
                        autodisass-java-bytecode
                        autopair bash-completion
                        blank-mode bm bog
                        bracketed-paste
                        browse-at-remote buffer-move
                        bundler calfw-org cargo cdlatex
                        centimacro cff cheat-sh cl
                        clang-format cmake-font-lock
                        cmake-ide cmake-mode
                        cmake-project coin-ticker
                        company-ansible company-ghc
                        company-ghci company-inf-ruby
                        company-solidity cpputils-cmake
                        csv-mode cuda-mode dante dictcc
                        diff-hl discover-my-major dkdo
                        dockerfile-mode ebal ecb edts
                        el-spec ellama elm-mode elmacro
                        enh-ruby-mode epresent eproject
                        evil evil-goggles evil-tex
                        face-shift fish-completion
                        fish-mode flycheck
                        flycheck-clang-analyzer
                        flycheck-clang-tidy
                        flycheck-color-mode-line
                        flycheck-credo
                        flycheck-demjsonlint
                        flycheck-dialyxir
                        flycheck-golangci-lint
                        flycheck-haskell
                        flycheck-kotlin flycheck-mix
                        flycheck-mode flycheck-package
                        flymake-cppcheck flymake-go
                        flymake-google-cpplint
                        flymake-haml
                        flymake-haskell-multi
                        flymake-hlint flymake-json
                        flymake-python-pyflakes
                        flymake-ruby flymake-rust
                        flymake-sass flymake-shell
                        flymake-yaml
                        flyspell-correct-popup
                        flyspell-lazy flyspell-popup
                        focus fold-dwim fold-this
                        frame-restore fullscreen-mode
                        german-holidays
                        ghc-imported-from
                        git-auto-commit-mode git-blame
                        git-commit-mode git-dwim
                        git-gutter git-rebase-mode
                        git-timemachine gitignore-mode
                        gnu-elpa-keyring-update
                        gnus-desktop-notify go-complete
                        go-direx go-dlv go-eldoc
                        go-errcheck go-fill-struct
                        go-guru go-imenu go-impl
                        go-playground go-playground-cli
                        go-projectile go-scratch golint
                        gore-mode gorepl-mode goto-chg
                        gptel haskell-cabal
                        haskell-emacs
                        haskell-emacs-base
                        haskell-emacs-text
                        haskell-interactive-mode
                        haskell-process
                        hasky-extensions hasky-stack
                        helm-ag helm-google helm-ispell
                        helm-jstack helm-rails helm-rb
                        helm-rubygems-org hi2
                        highlight-defined
                        highlight-doxygen
                        highlight-parentheses
                        highlight-symbol hipster-theme
                        hl-anything hl-todo
                        hlint-refactor html-to-markdown
                        humanoid-themes hyai icicles
                        idle-highlight-in-visible-buffers-mode
                        idle-org-agenda
                        ido-completing-read+ iedit
                        imenu+ indent-guide inf-elixir
                        irony jabber java-imports
                        java-snippets javadoc-lookup
                        javaimp javap-mode jdecomp jdee
                        json-mode json-reformat jtags
                        kotlin-mode latex-extra
                        latex-math-preview
                        latex-pretty-symbols
                        latex-preview-pane launch
                        launch-mode list-utils
                        llm-ollama lsp-clangd
                        lsp-elixir lsp-go lsp-haskell
                        lsp-java lsp-javacomp lsp-mode
                        lsp-python lsp-ui lua-mode
                        magic-latex-buffer magit
                        magit-commit-mark magit-delta
                        magit-file-icons
                        magit-filenotify magit-lfs
                        markdown-mode+ markdown-toc
                        mc-extras mic-paren miniedit
                        mix mkdown modern-cpp-font-lock
                        motion-mode multi-compile
                        nhexl-mode ninja-mode
                        nix-buffer nix-env-install
                        nix-haskell-mode nix-mode
                        nix-modeline nix-sandbox
                        nix-ts-mode nix-update
                        nixpkgs-fmt noxml-fold
                        ob-elixir ob-latex-as-png
                        ob-nix ob-rust org-ac
                        org-agenda-property
                        org-attach-screenshot
                        org-autolist org-beautify-theme
                        org-bullets org-caldav
                        org-cliplink
                        org-clock-agenda-daytime-mode
                        org-commentary org-dashboard
                        org-download
                        org-easy-img-insert
                        org-edit-latex org-ehtml
                        org-elp org-fstree org-gcal
                        org-inline-pdf org-jekyll
                        org-jira org-latex-impatient
                        org-link-minor-mode
                        org-nix-shell org-noter
                        org-page org-pdfview
                        org-projectile org-readme
                        org-repo-todo org-side-tree
                        org-superstar org-sync
                        org-table-comment org-wc
                        org-web-tools org-webpage
                        org2jekyll org2web
                        organize-imports-java
                        orgtbl-ascii-plot origami
                        ox-html5slide ox-mediawiki
                        ox-pandoc paren-completer
                        powerline powerline-evil
                        pretty-sha-path preview-dvisvgm
                        purescript-mode px python
                        python-mode qml-mode racer
                        rbenv realgud realgud-jdb
                        rinari robe rspec-mode rubocop
                        ruby-additional ruby-block
                        ruby-dev ruby-electric ruby-end
                        ruby-guard ruby-interpolation
                        ruby-refactor ruby-tools
                        rust-playground s sass-mode
                        schlau-compile scratch-pop
                        scss-mode shell-command shm
                        slack slime slime-company
                        slime-repl-ansi-color
                        smart-compile smart-shift
                        smartparens solaire-mode
                        sotlisp spell-fu spinner
                        stack-mode sublimity
                        sublimity-map sublimity-scroll
                        thread-dump tide timesheet
                        toc-org toml-mode tool-bar+
                        treemacs-all-the-icons
                        treemacs-all-the-icons-nerd-fonts
                        treemacs-evil treesit-auto
                        ts-comint tss typescript-mode
                        vterm vterm-toggle web-beautify
                        window-layout workgroups2
                        x-path-walker xenops xml+
                        yafolding yaml-mode yaml-tomato
                        yard-mode
                        yasnippet-classic-snippets
                        zossima))
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
