;; for ace-mc
;; (print "multiple-cursors loading" #'external-debugging-output)

(global-set-key (kbd "C-)") 'ace-mc-add-multiple-cursors)
(global-set-key (kbd "C-M-)") 'ace-mc-add-single-cursor)

(provide 'multiple-cursors)
