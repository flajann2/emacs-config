;; API Blueprint
(autoload 'apib-mode "apib-mode"
       "Major mode for editing API Blueprint files" t)
(add-to-list 'auto-mode-alist '("\\.apib\\'" . apib-mode))
(provide 'api-blueprint)
