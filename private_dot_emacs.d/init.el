(setq visible-bell t)
(setq standard-indent '2)

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; For a modus vivendi dark theme
(load-theme 'modus-vivendi t)

;; Set relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Choose the font family
(set-face-attribute 'default nil
		    :family "JetBrainsMono Nerd Font"
		    :height 140)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      backup-by-copying t    ; don't clobber symlinks
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)     ; use versioned backups
