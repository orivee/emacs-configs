
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-func)
(require 'init-packages)
(require 'init-ui.el)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'custom)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
