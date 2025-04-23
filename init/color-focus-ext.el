;;; Change color on focus
;; (use-package focus-color :ensure t)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(use-package doom-themes :ensure t)
(use-package adwaita-dark-theme :ensure t)

(use-package focus
  :ensure t
  :config
  (focus-mode 1) ;; Enable focus mode by default
  ;; Optional: Customize focus colors if needed
  (set-face-background 'focus-unfocused "blue1") ;; Unfocused color
  (set-face-background 'focus-focused "grey3")

  (defun my-change-background ()
    "Change background color based on focus."
    (dolist (frame (frame-list))
      (when (frame-live-p frame)  ;; Check if the frame is live
        (pcase (frame-focus-state frame)
          (`t   (set-face-background 'default "black" frame))  ;; Active frame color
          (`nil (set-face-background 'default "grey3" frame))))))  ;; Inactive frame color
  (add-function :after after-focus-change-function #'my-change-background)
  
;;;   (defun my-set-window-background (wwf)
;;;     "Set background color for the selected window."
;;;     (let ((active-bg   "black")    ;; Background color for active window
;;;           (inactive-bg "grey3")
;;;           (swf (selected-window))) ;; Selected window
;;;       (progn
;;;         (walk-windows
;;;          (lambda (w)
;;;            ;; (message "walk window: %s ||| %s" w swf)
;;;            (with-current-buffer (window-buffer w)
;;;              (if (eq w swf)
;;;                  (progn
;;;                    ;; (set-background-color active-bg)
;;;                    (set-face-background 'default active-bg)
;;;                    (message "active: %s" w))
;;;                (progn
;;;                  (set-face-background 'default inactive-bg)
;;;                  ;;(set-background-color inactive-bg)
;;;                  )))))
;;;       )))
;;;   (add-hook 'window-selection-change-functions 'my-set-window-background)
  )

;;; ;; (load-theme 'alveric t)
;;; 
;;; ;; background color?
;;; (set-face-background 'default "grey3")
;;; ;; background default color
;;; (add-hook 'after-make-frame-functions
;;;           (lambda (frame)
;;;             (select-frame frame)
;;;             (set-face-background 'default "grey3")))
;;; 
;;; ;;; Code:
;;; ;;; Change color on focus
;;; (add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
;;; (add-to-list 'default-frame-alist '(background-color . "grey3"))
;;; 
;;; (defun my-change-background ()
;;;   "Change background color based on focus."
;;;   (dolist (frame (frame-list))
;;;     (when (frame-live-p frame)  ;; Check if the frame is live
;;;       (pcase (frame-focus-state frame)
;;;         (`t (set-face-background 'default "black" frame))  ;; Active frame color
;;;         (`nil (set-face-background 'default "grey3" frame))))))  ;; Inactive frame color
;;; 
;;; (add-function :after after-focus-change-function #'my-change-background)

;;; (defun my-change-background ()
;;;   "Change the background color of the focused window."
;;;   (let ((focus-color "black")   ; Color when focused
;;;         (blur-color "blue"))     ; Color when not focused
;;;     (dolist (window (window-list))
;;;       (if (eq (selected-window) window)
;;;           (set-face-background 'default focus-color window)
;;;         (set-face-background 'default blur-color window)))))
;;; 
;;; ;; Use window-configuration-change-hook to detect focus changes
;;; (add-hook 'window-configuration-change-hook 'my-change-background)

(provide 'color-focus-ext)
