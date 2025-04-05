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
 '(package-selected-packages nil)
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
