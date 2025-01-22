;;; Change color on focus
(require 'focus-color)

;; Load my delightful themes, bitches!1!
(if (display-graphic-p)
    (load-theme 'hipster t))

;; (load-theme 'alveric t)

;; background color?
(set-face-background 'default "grey3")
;; background default color
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (set-face-background 'default "grey3")))

;;; Code:
;;; Change color on focus
(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
(add-to-list 'default-frame-alist '(background-color . "grey3"))

(defun my-change-background ()
  "Change background color based on focus."
  (dolist (frame (frame-list))
    (when (frame-live-p frame)  ;; Check if the frame is live
      (pcase (frame-focus-state frame)
        (`t (set-face-background 'default "black" frame))  ;; Active frame color
        (`nil (set-face-background 'default "grey3" frame))))))  ;; Inactive frame color

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
