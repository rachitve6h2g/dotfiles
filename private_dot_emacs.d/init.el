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
		    :family "IosevkaTerm Nerd Font"
		    :height 140)
