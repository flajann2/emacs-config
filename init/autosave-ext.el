;; Autosave
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1.0)
(auto-save-buffers-enhanced t)
;;  (setq auto-save-buffers-enhanced-include-regexps '(".+"))
;;  (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))

(provide 'autosave-ext)
