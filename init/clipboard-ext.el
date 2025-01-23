;; Clipboard
;; TODO: WIP

(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary nil)

;;; (defun my-wayland-copy ()
;;;   "Copy selected text to Wayland clipboard."
;;;   (interactive)
;;;   (call-process "wl-copy" nil nil nil "--" (buffer-substring-no-properties (region-beginning) (region-end))))
;;; 
;;; (defun my-wayland-paste ()
;;;   "Paste text from Wayland clipboard."
;;;   (interactive)
;;;   (let ((clip (with-temp-buffer
;;;                 (call-process "wl-paste" nil t nil "--no-newline")
;;;                 (buffer-string))))
;;;     (insert clip)))
;;; 
;;; (global-set-key (kbd "C-p") 'my-wayland-paste)
;;; (global-set-key (kbd "C-y") 'my-wayland-copy)

;;; TODO: Try this on emacs-wayland
;; credit: yorickvP on Github
(setq wl-copy-process nil)
(defun wl-copy (text)
  (setq wl-copy-process (make-process :name "wl-copy"
                                      :buffer nil
                                      :command '("wl-copy" "-f" "-n")
                                      :connection-type 'pipe
                                      :noquery t))
  (process-send-string wl-copy-process text)
  (process-send-eof wl-copy-process))
(defun wl-paste ()
  (if (and wl-copy-process (process-live-p wl-copy-process))
      nil ; should return nil if we're the current paste owner
      (shell-command-to-string "wl-paste -n | tr -d \r")))
(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)

(provide 'clipboard-ext)
