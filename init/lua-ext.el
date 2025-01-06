;; lua settings
;; See https://github.com/immerrr/lua-mode for further documentation

;; indentation offset in spaces
(setq lua-indent-level 3)

;; set to t if you like to have contents of multiline strings to be indented like comments
(setq lua-indent-string-contents t)

;; version of lua to run
(setq lua-default-application "lua5.3")

;; switches to pass to lua, like -i for interactive
(setq lua-default-command-switches "-i")

(provide 'lua-ext)










