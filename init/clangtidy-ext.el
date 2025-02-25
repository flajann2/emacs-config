;; Clang tidy

(use-package flycheck
  :ensure t
  :hook  (flycheck-mode . flycheck-clang-tidy-setup))

(provide 'clangtidy-ext)
