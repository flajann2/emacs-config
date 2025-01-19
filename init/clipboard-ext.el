;; Clipboard

(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary nil)


(defun my-wayland-copy ()
  "Copy selected text to Wayland clipboard."
  (interactive)
  (call-process "wl-copy" nil nil nil "--" (buffer-substring-no-properties (region-beginning) (region-end))))

(defun my-wayland-paste ()
  "Paste text from Wayland clipboard."
  (interactive)
  (let ((clip (with-temp-buffer
                (call-process "wl-paste" nil t nil "--no-newline")
                (buffer-string))))
    (insert clip)))

(global-set-key (kbd "C-p") 'my-wayland-paste)
(global-set-key (kbd "C-y") 'my-wayland-copy)

;;; TODO: This supposedly now works on emacs-wayland. https://www.reddit.com/r/emacs/comments/1hrv53z/comment/m7miu4z/?%24deep_link=true&correlation_id=3c444dca-0f43-40e7-9e81-4583a2d9369e&ref=email_comment_reply&ref_campaign=email_comment_reply&ref_source=email
;;; ;; Better support for clipboard and primary selection
;;; (setq x-select-request-type
;;;     '(UTF8_STRING COMPOUND_TEXT STRING text/plain\;charset=utf-8))
;;; ;; Enable clipboard and primary selection
;;; (setq select-enable-clipboard t
;;;     select-enable-primary t
;;;     x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;;; (defun paste-from-wayland-clipboard ()
;;;     "Paste using wl-paste."
;;;     (interactive)
;;;     (let ((text (shell-command-to-string "wl-paste -n")))
;;;     (if (not (string-empty-p text))
;;;     (insert text)
;;;     (message "Clipboard is empty"))))
;;; (global-set-key (kbd "C-c p") 'paste-from-wayland-clipboard)

;;; TODO: Try this on emacs-wayland
;;;   ;; credit: yorickvP on Github
;;;   (setq wl-copy-process nil)
;;;   (defun wl-copy (text)
;;;     (setq wl-copy-process (make-process :name "wl-copy"
;;;                                         :buffer nil
;;;                                         :command '("wl-copy" "-f" "-n")
;;;                                         :connection-type 'pipe
;;;                                         :noquery t))
;;;     (process-send-string wl-copy-process text)
;;;     (process-send-eof wl-copy-process))
;;;   (defun wl-paste ()
;;;     (if (and wl-copy-process (process-live-p wl-copy-process))
;;;         nil ; should return nil if we're the current paste owner
;;;         (shell-command-to-string "wl-paste -n | tr -d \r")))
;;;   (setq interprogram-cut-function 'wl-copy)
;;;   (setq interprogram-paste-function 'wl-paste)

(provide 'clipboard-ext)
