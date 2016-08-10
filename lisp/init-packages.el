 (when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
    ) 
    (require 'cl)

    ;; add whatevar packages you want here
    (defvar orivee/packages '(
                             company
			     color-theme-sanityinc-tomorrow
			     hungry-delete
			     swiper
			     counsel
			     smartparens
			     exec-path-from-shell
			     popwin
                             ) "Default package")

    (defun orivee/packages-installed-p ()
      (loop for pkg in orivee/packages
            when (not (package-installed-p pkg)) do (return nil)
            finally (return t)))
    
    (unless (orivee/packages-installed-p)
      (message "%s" "Refreshing package database...")
      (package-refresh-contents)
      (dolist (pkg orivee/packages)
        (when (not (package-installed-p pkg))
          (package-install pkg))))

;; let emacs could find the execute files
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode t)

(load-theme 'sanityinc-tomorrow-bright t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
