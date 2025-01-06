;;; Change color on focus
;;; (require 'focus-color)

;;; Code:
;;; Change color on focus
(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
(add-to-list 'default-frame-alist '(background-color . "#00007f"))

(defun my-change-background ()
  "Change background color based on focus."
  (dolist (frame (frame-list))
    (when (frame-live-p frame)  ;; Check if the frame is live
      (pcase (frame-focus-state frame)
        (`t (set-face-background 'default "black" frame))  ;; Active frame color
        (`nil (set-face-background 'default "blue" frame))))))  ;; Inactive frame color

(add-function :after after-focus-change-function #'my-change-background)

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










