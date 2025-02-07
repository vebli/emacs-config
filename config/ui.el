(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)

(setq ring-bell-function 'ignore)  

(set-face-attribute 'default nil :font "FiraCode Nerd Font")

(load-theme 'tango-dark) 
;(load-theme 'dracula) 

