;; all good stuff Java.

;; lsp Java IDE
(require 'lsp-javacomp)
(add-hook 'java-mode-hook #'lsp-javacomp-enable)

;; JDEE
(add-to-list 'load-path (format "%s/dist/jdee-2.4.1/lisp" my-jdee-path))
(autoload 'jde-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))
