;; Spelling Checker (see https://github.com/cute-jumper/ace-flyspell)
(use-package flyspell
  :ensure nil
  :if (executable-find "hunspell")
  :init
  (setq ispell-program-name "hunspell"
        ispell-dictionary "en_US"
        ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))
        ;; Preset so ispell never runs `hunspell -D`, which scans the cwd
        ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode)))

(use-package ace-flyspell
  :ensure t
  :after flyspell
  :commands (ace-flyspell-correct-word ace-flyspell-jump-word ace-flyspell-dwim))

(provide 'spelling-checker)
