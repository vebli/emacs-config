(setq inhibit-startup-message t)
(setq display-line-numbers-type 'relative)  
(global-display-line-numbers-mode t)       
(scroll-bar-mode -1) 
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers in certain modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook
		vterm-mode-hook
        ))
  (add-hook mode(lambda() (display-line-numbers-mode 0))))

(setq ring-bell-function 'ignore)  

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 135)
;;(set-face-attribute 'variable-pitch nil :font "Inter") 
;;(set-face-attribute 'fixed-pitch nil :family "Courier New")

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package all-the-icons) ; Need to be installed with 'M-x all-the-icons-install-fonts'

;; Themes
(use-package constant-theme)
(use-package tao-theme)
(use-package doom-themes) 
(use-package sexy-monochrome-theme)

(load-theme 'sexy-monochrome t)
