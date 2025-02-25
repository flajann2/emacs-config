;;;;;; all sweet things CMake goes here

;;;; CMake Project
;;;; (defun maybe-cmake-project-hook ()
;;;;   (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
;;;; (add-hook 'c-mode-hook 'maybe-cmake-project-hook)
;;;; (add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

;;;; cpputils-cmake
(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))

;; OPTIONAL, avoid typing full path when starting gdb
(global-set-key (kbd "C-c C-g")
 '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))

;; OPTIONAL, some users need specify extra flags forwarded to compiler
;; (setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))

;; No stinky makefiles for flymake
(setq cppcm-write-flymake-makefile nil)

;; flycheck clang
(with-eval-after-load 'flycheck
   (use-package flycheck-clang-analyzer :ensure t)
   (flycheck-clang-analyzer-setup))

;;; ;; flycheck clang-tidy -- duplicate
;;; (eval-after-load 'flycheck
;;;   '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

;; auto complete c++
(ac-config-default)
(use-package auto-complete-clang-async :ensure t)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(provide 'cmake-omnibus)
