;; Clang tidy

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

(provide 'clangtidy-ext)
