;; Rust support
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(use-package flymake-rust :ensure t)
(add-hook 'rust-mode-hook 'flymake-rust-load)
(setq flymake-rust-use-cargo 1)
(use-package multi-compile :ensure t)
(setq multi-compile-alist '(
                            (rust-mode . (("rust-debug" . "cargo run")
                                          ("rust-release" . "cargo run --release")
                                          ("rust-test" . "cargo test")))
                            ))


;; Issue #6887: Rather than inheriting the 'gnu compilation error
;; regexp (which is broken on a few edge cases), add our own 'rust
;; compilation error regexp and use it instead.
    (defvar rustc-compilation-regexps
      (let ((file "\\([^\n]+\\)")
            (start-line "\\([0-9]+\\)")
            (start-col  "\\([0-9]+\\)")
            (end-line   "\\([0-9]+\\)")
            (end-col    "\\([0-9]+\\)")
            (msg-type   "\\(?:[Ee]rror\\|\\([Ww]arning\\)\\|\\([Nn]ote\\|[Hh]elp\\)\\)"))
        (let ((re (concat "^" file ":" start-line ":" start-col
                          ": " end-line ":" end-col
                          " " msg-type ":")))
          (cons re '(1 (2 . 4) (3 . 5) (6 . 7)))))
      "Specifications for matching errors in rustc invocations.
    See `compilation-error-regexp-alist' for help on their format.")

    (defvar rustc-new-compilation-regexps
      (let ((file "\\([^\n]+\\)")
            (start-line "\\([0-9]+\\)")
            (start-col  "\\([0-9]+\\)"))
        (let ((re (concat "^ *--> " file ":" start-line ":" start-col ; --> 1:2:3
                          )))
          (cons re '(1 2 3))))
      "Specifications for matching errors in rustc invocations (new style).
    See `compilation-error-regexp-alist' for help on their format.")

    ;; Match test run failures and panics during compilation as
    ;; compilation warnings
    (defvar cargo-compilation-regexps
      '("^\\s-+thread '[^']+' panicked at \\('[^']+', \\([^:]+\\):\\([0-9]+\\)\\)" 2 3 nil nil 1)
      "Specifications for matching panics in cargo test invocations.
    See `compilation-error-regexp-alist' for help on their format.")

    (defun rustc-scroll-down-after-next-error ()
      "In the new style error messages, the regular expression
       matches on the file name (which appears after `-->`), but the
       start of the error appears a few lines earlier. This hook runs
       after `M-x next-error`; it simply scrolls down a few lines in
       the compilation window until the top of the error is visible."
      (save-selected-window
        (when (eq major-mode 'rust-mode)
          (select-window (get-buffer-window next-error-last-buffer 'visible))
          (when (save-excursion
                  (beginning-of-line)
                  (looking-at " *-->"))
            (let ((start-of-error
                   (save-excursion
                     (beginning-of-line)
                     (while (not (looking-at "^[a-z]+:\\|^[a-z]+\\[E[0-9]+\\]:"))
                       (forward-line -1))
                     (point))))
              (set-window-start (selected-window) start-of-error))))))

    (eval-after-load 'compile
      '(progn
         (add-to-list 'compilation-error-regexp-alist-alist
                      (cons 'rustc-new rustc-new-compilation-regexps))
         (add-to-list 'compilation-error-regexp-alist 'rustc-new)
         (add-hook 'next-error-hook 'rustc-scroll-down-after-next-error)
         (add-to-list 'compilation-error-regexp-alist-alist
                      (cons 'rustc rustc-compilation-regexps))
         (add-to-list 'compilation-error-regexp-alist 'rustc)
         (add-to-list 'compilation-error-regexp-alist-alist
                      (cons 'cargo cargo-compilation-regexps))
         (add-to-list 'compilation-error-regexp-alist 'cargo)))
(provide 'rust-support)
