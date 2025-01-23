;; Spelling Checker (see https://github.com/cute-jumper/ace-flyspell)
(use-package ace-flyspell
             :ensure t
             :config
                (setq ispell-program-name "hunspell")
                (setq ispell-local-dictionary "en_US")
                (setq ispell-local-dictionary-alist
                    '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
                (flyspell-mode 1))

(provide 'spelling-checker)

