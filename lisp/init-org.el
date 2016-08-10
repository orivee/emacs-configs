(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/working/todo"))
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
