;; Set up ECB
(require 'ecb)

;; Launch ecb only if in graphic mode!!!!
(setq ecb-tip-of-the-day nil)
(if (display-graphic-p)
    (ecb-activate)
)

;; Allow ECB to pop to another frame
(defun ecb-activated-in-selected-frame ()
  "A hack to use ECB in multiple frames. It first deactivates ECB, then
    activate it in current frame."
  (interactive)
  (let ((current-frame (selected-frame)))
                                        ; The frame foucs change when activating or deactivating ECB is weird, so
                                        ; activate current selected frame explicitly.
    (if (and (boundp 'ecb-minor-mode) (ecb-minor-mode))
        (ecb-deactivate)
      )
    (select-frame current-frame)
    (ecb-activate)
    )
  )

(global-set-key [C-M-s-tab] 'ecb-activated-in-selected-frame)
(global-set-key (kbd "<C-tab>") 'ecb-toggle-layout)
(global-set-key (kbd "<C-iso-lefttab>") 'ecb-toggle-ecb-windows)

;; this needs some work
(ecb-layout-define "dev-needs-work" left nil
                   (ecb-set-directories-buffer)
                   (ecb-split-ver 0.25 t)
                   (other-window 1)
                   ;; (select-window (next-window))
                   (ecb-set-methods-buffer)
                   (ecb-split-ver 0.50 t)
                   (other-window 1)
                   (ecb-set-sources-buffer)
                   ;; 5. Make the ECB-edit-window current (see Postcondition above)
                   ;; (select-window (next-window))
                   )

(provide 'ecb-ext)


