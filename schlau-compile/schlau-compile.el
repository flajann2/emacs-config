;;; schlau-compile.el --- an interface to `compile'
;; URL: https://github.com/flajann2/elisp#schlau-compile
;; Version: 20200201

;; Copyright (C) 2018-2025 by Fred Mitchell
;; Copyright (C) 1998-2017 by Seiji Zenitani

;; Author: Fred Mitchell <fred.mitchell@gmx.de>
;; Keywords: tools, unix, git
;; Created: 2018-01-14
;; Compatibility: Emacs 24 or later
;; URL(en): https://github.com/flajann2/elisp/blob/master/schlau-compile.el

;; Contributors: Fred Mitchell
;; smart-compile contribtors: Seiji Zenitani, Sakito Hisakura, Greg Pfell

;; Please refer to the README.org for the actual documentation.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; The enhancements made by Fred Mitchell are released under the
;; MIT license..

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.
;; See also the MIT license.

;;; Commentary:

;; This package provides `schlau-compile' function. It was derived from
;; 'smart-compile'. However, the modifications that exist here, including
;; change in the overall functionality and workflow, are no longer upstreamable
;; and should be considered a completely seprate project.
;;
;; You can associate a particular file with a particular compile function,
;; by editing `schlau-compile-alist'.
;;
;; To use this package, add these lines to your .emacs file:
;;     (require 'schlau-compile)
;;
;; Note that it requires emacs 24 or later.
;;
;; https://github.com/flajann2/elisp/blob/master/README.org

;;; Code:

(defgroup schlau-compile nil
  "An interface to `compile'."
  :group 'processes
  :prefix "schlau-compile")

(defcustom schlau-compile-alist '(
  (emacs-lisp-mode    . (emacs-lisp-byte-compile))
  (html-mode          . (browse-url-of-buffer))
  (nxhtml-mode        . (browse-url-of-buffer))
  (html-helper-mode   . (browse-url-of-buffer))
  (octave-mode        . (run-octave))
  ("\\.c\\'"          . "gcc -O2 %f -lm -o %n")
  ("\\.[Cc]+[Pp]*\\'" . "g++ -O2 %f -lm -o %n")
  ("\\.cron\\(tab\\)?\\'" . "crontab %f")
  ("\\.[Ff]\\'"       . "gfortran %f -o %n")
  ("\\.f90\\'"        . "gfortran %f -o %n")
  ("\\.hs\\'"         . "ghc %f -o %n")
  ("\\.java\\'"       . "javac %f")
  ("\\.m\\'"          . "gcc -O2 %f -lobjc -lpthread -o %n")
  ("\\.mp\\'"         . "mptopdf %f")
  ("\\.php\\'"        . "php -l %f")
  ("\\.pl\\'"         . "perl %f")
  ("\\.py\\'"         . "python %f")
  ("\\.rb\\'"         . "ruby %f")
  ("Rakefile\\'"      . "rake")
  ("\\.tex\\'"        . (tex-file))
  ("\\.texi\\'"       . "makeinfo %f")
)  "Alist of filename patterns vs corresponding format control strings.
Each element looks like (REGEXP . STRING) or (MAJOR-MODE . STRING).
Visiting a file whose name matches REGEXP specifies STRING as the
format control string.  Instead of REGEXP, MAJOR-MODE can also be used.
The compilation command will be generated from STRING.
The following %-sequences will be replaced by:

  %F  absolute pathname            ( /devopment/your_project/src/main.cpp )
  %f  file name without directory  ( main.cpp )
  %n  file name without extension  ( main )
  %e  extension of file name       ( cpp )
  %G  root path of git project     ( /devopment/your_project/ )

  %o  value of `schlau-compile-option-string'  ( \"user-defined\" ).

If the second item of the alist element is an emacs-lisp FUNCTION,
evaluate FUNCTION instead of running a compilation command.
"
   :type '(repeat
           (cons
            (choice
             (regexp :tag "Filename pattern")
             (function :tag "Major-mode"))
            (choice
             (string :tag "Compilation command")
             (sexp :tag "Lisp expression"))))
   :group 'schlau-compile)
(put 'schlau-compile-alist 'risky-local-variable t)

(defconst schlau-compile-replace-alist '(
                                        ("%F" . (buffer-file-name))
                                        ("%G" . (schlau-compile-git-root-path))                                                                                  
                                        ("%f" . (file-name-nondirectory (buffer-file-name)))
                                        ("%n" . (file-name-sans-extension
                                                 (file-name-nondirectory (buffer-file-name))))
                                        ("%e" . (or (file-name-extension (buffer-file-name)) ""))
                                        ("%o" . schlau-compile-option-string)
                                        )
  "Alist of %-sequences for format control strings in `schlau-compile-alist'.")
(put 'schlau-compile-replace-alist 'risky-local-variable t)

(defvar schlau-compile-check-makefile nil)
(make-variable-buffer-local 'schlau-compile-check-makefile)

(defcustom schlau-compile-make-program "make "
  "The command by which to invoke the make program."
  :type 'string
  :group 'schlau-compile)

(defcustom schlau-compile-option-string ""
  "The option string that replaces %o.  The default is empty."
  :type 'string
  :group 'schlau-compile)


;;;###autoload
(defun schlau-compile (&optional arg)
  "An interface to `compile'.
It calls `compile' or other compile function,
which is defined in `schlau-compile-alist'."
  (interactive "p")
  (let ((name (buffer-file-name))
        (not-yet t))
    
    (if (not name)(error "cannot get filename."))
;;     (message (number-to-string arg))

    (cond
     ;; local command
     ;; The prefix 4 (C-u M-x schlau-compile) skips this section
     ;; in order to re-generate the compile-command
     ((and (not (= arg 4)) ; C-u M-x schlau-compile
           (local-variable-p 'compile-command)
           compile-command)
      (schlau-compile-compile-it)
      (setq not-yet nil)
      )

     ;; make?
     ((and schlau-compile-check-makefile
           (or (file-readable-p "Makefile")
               (file-readable-p "makefile")))
      (if (y-or-n-p "Makefile is found.  Try 'make'? ")
          (progn
            (set (make-local-variable 'compile-command) "make ")
            (schlau-compile-compile-it)
            (setq not-yet nil)
            )
        (setq schlau-compile-check-makefile nil)))

     ) ;; end of (cond ...)

    ;; compile
    (let( (alist schlau-compile-alist) 
          (case-fold-search nil)
          (function nil) )
      (while (and alist not-yet)
        (if (or
             (and (symbolp (caar alist))
                  (eq (caar alist) major-mode))
             (and (stringp (caar alist))
                  (string-match (caar alist) name))
             )
            (progn
              (setq function (cdar alist))
              (if (stringp function)
                  (progn
                    (set (make-local-variable 'compile-command)
                         (schlau-compile-string function))
                    (schlau-compile-compile-it)
                    )
                (if (listp function)
                    (eval function)
                    ))
              (setq alist nil)
              (setq not-yet nil)
              )
          (setq alist (cdr alist)) )
        ))

    ;; If compile-command is not defined and the contents begins with "#!",
    ;; set compile-command to filename.
    (if (and not-yet
             (not (memq system-type '(windows-nt ms-dos)))
             (not (string-match "/\\.[^/]+$" name))
             (not
              (and (local-variable-p 'compile-command)
                   compile-command))
             )
        (save-restriction
          (widen)
          (if (equal "#!" (buffer-substring 1 (min 3 (point-max))))
              (set (make-local-variable 'compile-command) name)
            ))
      )
    
    ;; compile
    (if not-yet (schlau-compile-compile-it) )
    
    ))

(defun schlau-compile-string (format-string)
  "Document forthcoming..."
  (if (and (boundp 'buffer-file-name)
           (stringp buffer-file-name))
      (let ((rlist schlau-compile-replace-alist)
            (case-fold-search nil))
        (while rlist
          (while (string-match (caar rlist) format-string)
            (setq format-string
                  (replace-match
                   (eval (cdar rlist)) t nil format-string)))
          (setq rlist (cdr rlist))
          )
        ))
  format-string)

(defun schlau-compile-project-path (path key)
  "traverse up the directory path for key,
  and either return the path to key or nil."
  (print path #'external-debugging-output)
  (if (file-exists-p (concat path "/" key))
      path
    (if (string= path "/")
        nil
      (schlau-compile-project-path (file-name-directory
                     (replace-regexp-in-string "\\\/$" ""  path)) key)
    )))

(defun schlau-compile-git-root-path ()
  "find the root git path of the current
  project (assuming you are using git)"
  (schlau-compile-project-path buffer-file-name ".git"))

(defun schlau-compile-compile-it ()
  "Will either compile or recompile
   depending on schlau-recompile-it"
  (if schlau-recompile-it
      (call-interactively 'recompile)
    (call-interactively 'compile))
  )

;;;###autoload
(defun schlau-compile-query ()
  "Allow user to alter compile commands"
  (interactive)
  (setq schlau-recompile-it nil)
  (call-interactively 'schlau-compile)
  )

;;;###autoload
(defun schlau-compile-compile ()
  "Compile with the previous or default compile commands"
  (interactive)
  (setq schlau-recompile-it t)
  (call-interactively 'schlau-compile)
  )

(provide 'schlau-compile)
;;; schlau-compile.el ends here
