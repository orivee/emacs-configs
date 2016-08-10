(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|192.*\\)")
     ("http" . "127.0.0.1:7777")))


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

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x f") 'counsel-describe-function)
(global-set-key (kbd "C-x C-v") 'counsel-describe-variable)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(tool-bar-mode -1) ;; turn off tool-bar
(scroll-bar-mode -1) ;; turn off scroll-bar
(setq inhibit-splash-screen t) ;; turn off splash screen
(global-linum-mode t) ;; show line number
 
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(recentf-mode t)
(global-company-mode t)

(setq-default cursor-type 'bar) ;; change cursor type 

(setq make-backup-files nil) ;; disable backup files

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "\C-x\ \C-r") 'recentf-open-files)

(delete-selection-mode t)

(set-default-font "PragmataPro-12")

(global-hl-line-mode t)

(load-theme 'sanityinc-tomorrow-bright t)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/working/todo"))
(global-set-key (kbd "C-c a") 'org-agenda)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
