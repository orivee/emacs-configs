(setq ring-bell-function 'ignore)

(global-linum-mode t) ;; show line number

(delete-selection-mode t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ))

(setq make-backup-files nil) ;; disable backup files
(setq auto-save-default nil) ;; disable auto-save

(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; (add-hook 'emacs-lisp-mode-hook 'show-paren-match)

;; improve indent region
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, other the whole buffer. "
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-functions-list '(
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;; less tying when Emacs ask you yes or no
(fset 'yes-or-no 'y-or-n)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(setq dired-dwim-target t)
(provide 'init-better-defaults)
