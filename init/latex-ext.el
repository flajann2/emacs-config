;; Enable AUCTeX
(use-package tex
                :ensure t
                :config
                (setq TeX-auto-save t)
                (setq TeX-parse-self t))

(provide 'latex-ext)
