;; Enable AUCTeX
(use-package tex
                :ensure auctex
                :defer t
                :config
                (setq TeX-auto-save t)
                (setq TeX-parse-self t))

(provide 'latex-ext)
