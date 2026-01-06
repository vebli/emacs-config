(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package magit)

(load (expand-file-name "config/pkgs/evil.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/direnv.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/general.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/dev.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/dashboard.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/completions.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/latex.el" user-emacs-directory))
(load (expand-file-name "config/pkgs/pdf-tools.el" user-emacs-directory))

