;; Folding
(require 'yafolding)

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

(lambda ()
    (yafolding-show-all)
    (delete-trailing-whitespace))

(define-key yafolding-mode-map (kbd "<C-S-return>") nil)
(define-key yafolding-mode-map (kbd "<C-M-return>") nil)
(define-key yafolding-mode-map (kbd "<C-return>") nil)

(define-key yafolding-mode-map [f10] 'yafolding-toggle-all)
(define-key yafolding-mode-map [f9] 'yafolding-hide-parent-element)
(define-key yafolding-mode-map [f1] 'yafolding-toggle-element)

(provide 'folding-ext)
