(setq inhibit-startup-message t)

(scroll-bar-mode -1) 
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)

(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda() (display-line-numbers-mode 0))))

(setq ring-bell-function 'ignore)  

(set-face-attribute 'default nil :font "FiraCode Nerd Font")

(load-theme 'doom-laserwave t)

