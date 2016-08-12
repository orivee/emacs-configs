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
			  popwin
			  web-mode
			  expand-region
			  iedit
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

;;(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config web-mode for html, css files
;;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq auto-mode-alist
      (append
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; config for web mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ;; HTML element offset indentation
  (setq web-mode-css-indent-offset 2)  ;; CSS offset indentation
  (setq web-mode-code-indent-offset 2)   ;; Script/code offset indentation (for JavaScript, Java, PHP, Ruby, VBScript, Python, etc.)
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (eq major-mode 'web-mode)
      (progn
	(setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	(setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	(setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  
  )

(global-company-mode t)

(load-theme 'sanityinc-tomorrow-bright t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
