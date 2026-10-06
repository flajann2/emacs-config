;; Enable AUCTeX
(use-package tex
  :ensure auctex
  :defer t
  :hook ((LaTeX-mode . font-lock-mode)
         (LaTeX-mode . prettify-symbols-mode))   ; optional: \alpha → α
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)                 ; parse document so custom macros get highlighted
  (font-latex-fontify-script t)      ; raise/lower sub- and superscripts
  (font-latex-fontify-sectioning 1.3) ; scale section headings
  (font-latex-script-display '((raise -0.2) . (raise 0.2))))
(provide 'latex-ext)
