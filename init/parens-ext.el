;; parens!!!!
(require 'mic-paren) ; loading
(paren-activate)     ; activating
;;(add-function :around show-paren-data-function #'my-show-paren-any)

(require 'smartparens-config)

(setq show-paren-delay 2)
(setq show-paren-style 'expression)
;; (set-face-background 'show-paren-match-face "#115588")
;; (set-face-attribute 'show-paren-match-face nil
;;         :weight 'bold :underline nil :overline nil :slant 'normal)
;; (set-face-foreground 'show-paren-mismatch-face "red")
;; (set-face-attribute 'show-paren-mismatch-face nil
;;                     :weight 'bold :underline t :overline nil :slant 'normal)
 
(defun my-par-express ()
  (setq show-paren-style 'expression))

(defun my-par-paren ()
  (setq show-paren-style 'parenthesis))

;;(global-set-key [mouse-8] 'my-par-express)
;;(global-set-key [mouse-9] 'my-par-paren)

(provide 'parens-ext)
