(setq inhibit-startup-message t)
(setq display-line-numbers-type 'relative)  
(setq lsp-semantic-tokens-enable t)
(setq ring-bell-function 'ignore)  
(setq use-dialog-box nil)
(global-display-line-numbers-mode t)       
(scroll-bar-mode -1) 
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)

(use-package tab-bar
  :ensure nil
  :config
  (setq tab-bar-close-button-show nil
        tab-bar-new-button-show nil
	tab-bar-separator " "
	tab-bar-border 0
	tab-bar-button-relief 0)
    (tab-bar-mode 1))

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers in certain modes
(dolist (mode '(term-mode-hook
		shell-mode-hook
		eshell-mode-hook
		vterm-mode-hook))
  (add-hook mode(lambda() (display-line-numbers-mode 0))))

;; Ligatures
(use-package ligature)
(ligature-set-ligatures 't '("www"))
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)

;; (set-face-attribute 'fixed-pitch nil :family "Courier New")

(use-package doom-modeline
  :init
  (setq doom-modeline-height 20 
	doom-modeline-bar-width 0)
  :config (doom-modeline-mode 1))

;; (use-package doom-modeline
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package all-the-icons) ; Need to be installed with 'M-x all-the-icons-install-fonts'

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))


;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/config/themes/")
(use-package doom-themes) 

(load-theme 'minimal t)
