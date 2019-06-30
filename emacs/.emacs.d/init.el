(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-control-modifier 'control)


;; set up package stuff
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq vc-follow-symlinks t)

(org-babel-load-file "~/.emacs.d/config.org")
(when (file-exists-p "~/.emacs.d/local.org") (org-babel-load-file "~/.emacs.d/local.org"))
