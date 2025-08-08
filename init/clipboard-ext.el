;; Clipboard
;; TODO: WIP

(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary nil)

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

(setq interprogram-cut-function   'wl-copy)
(setq interprogram-paste-function 'wl-past
(provide 'clipboard-ext)
