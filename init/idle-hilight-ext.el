;; idle highlight
(require 'idle-highlight-in-visible-buffers-mode)

(set-face-attribute 'idle-highlight-in-visible-buffers nil
                    :background "DarkOrange3"
                    :foreground "dark blue"
                    :weight 'bold)

(add-hook 'prog-mode-hook 'idle-highlight-in-visible-buffers-mode)

(provide 'idle-hilight-ext)
