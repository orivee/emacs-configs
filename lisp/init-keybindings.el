(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x f") 'counsel-describe-function)
(global-set-key (kbd "C-x C-v") 'counsel-describe-variable)
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "\C-x\ \C-r") 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "M-/") 'hippie-expand)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-;") 'iedit-mode)
(provide 'init-keybindings)
