(require 'gud)

; GDB layout
(defadvice gdb-setup-windows (after activate)
  (gdb-setup-my-windows)
)

(defun gdb-setup-my-windows ()
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let
    ((win0 (selected-window))             ; breakpoints
     (win1 (split-window-horizontally
         (floor (* 0.5 (window-width)))))   ; source + i/o
     (win2 (split-window-vertically
         (floor (* 0.5 (window-body-height))))) ; gdb
     (win3 (split-window-vertically
        (floor (* 0.5 (window-body-height))))) ; locals
     (win4 (split-window-vertically
         (floor (* 0.6 (window-body-height))))) ; stack
     (win5 (split-window-vertically
         (floor (* 0.6 (window-body-height))))) ; disassembly
    )
    (select-window win1)
    ; configurating right window
    (let
    ((winSrc (selected-window)) ; source
     (winIO (split-window-vertically (floor (* 0.9 (window-body-height))))) ; I/O
     )
      (set-window-buffer winIO (gdb-get-buffer-create 'gdb-inferior-io))
      (set-window-buffer
    winSrc
    (if gud-last-last-frame
     (gud-find-file (car gud-last-last-frame))
      (if gdb-main-file
       (gud-find-file gdb-main-file)
     (list-buffers-noselect))))
      (setq gdb-source-window winSrc)
      (set-window-dedicated-p winIO t)
   )

    (set-window-buffer win0 (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (set-window-buffer win3 (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-buffer win4 (gdb-get-buffer-create 'gdb-stack-buffer))
    (set-window-buffer win5 (gdb-get-buffer-create 'gdb-disassembly-buffer))
    (select-window win2)
  )
)

; GDB variables
(setq gdb-many-windows t)
(setq gdb-show-main t)
(setq gdb-show-changed-values t)
(setq gdb-use-colon-colon-notation t)
(setq gdb-use-separate-io-buffer nil)
(setq gdb-delete-out-of-scope t)
(setq gdb-speedbar-auto-raise t)

;; so it can open in a different frame
(defun my-gdb-other-frame ()
  (interactive)
  (select-frame (make-frame))
  (call-interactively 'gdb))

; invoke
(global-set-key [f12] 'my-gdb-other-frame)

(provide 'gdb-ext)
