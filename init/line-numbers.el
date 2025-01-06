;; line numbers for programming
(global-display-line-numbers-mode nil)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Change to 'relative or 'absolute or 'visual as needed
(setq display-line-numbers-type 'absolute)

;; appearance
(setq display-line-numbers-width-start nil)  ; Automatically adjust width based on content
(setq display-line-numbers-grow-only nil)       ; Prevent shrinking of the width

;; face
(set-face-attribute 'line-number nil :foreground "purple")
(set-face-attribute 'line-number-current-line nil :foreground "goldenrod" :weight 'bold)
(set-face-attribute 'line-number nil :height 70)  ; Set to desired height (in tenths of points)
(set-face-attribute 'line-number-current-line nil :height 70)  ; For current line number

;; fomatting
(defun my-display-line-numbers-format (line)
  "Custom format for line numbers with padding."
  (format " %d:  " line))  ; Adjust spaces as needed
(setq display-line-numbers-format 'my-display-line-numbers-format)
(setq-default fringes-outside-margins t) ; Adjusts fringe behavior

;; toggle
(global-set-key (kbd "C-SPC") 'display-line-numbers-mode)

(provide 'line-numbers)
