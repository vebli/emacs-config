(require 'project)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package magit)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  )

(use-package toggle-term)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package all-the-icons) ; Need to be installed with 'M-x all-the-icons-install-fonts'

(load (expand-file-name "config/pkgs/evil.el" user-emacs-directory))
; (load (expand-file-name "config/pkgs/org.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/general.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/dev.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/dashboard.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/completions.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/projectile.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/latex.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/pdf-tools.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/themes.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(general evil-org ivy evil command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
