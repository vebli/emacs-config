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

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org)
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


(use-package org
  :ensure t  
  :pin gnu  
  :config
  (setq org-startup-indented t       ;; Pretty indentation
        org-hide-leading-stars t      ;; Hide leading stars in headings
        org-ellipsis " ⬎"))          ;; Nice folding symbol

(use-package dracula-theme
  :ensure t)

(use-package general
  :after evil
  :config
  (general-create-definer leader
    :states '(normal visual motion) ;; Define states here
    :keymaps 'override  ;; Ensures it works globally
    :prefix "SPC")  ;; Sets Space as leader key

  (leader
    "ff" 'find-file
    "bm" 'switch-to-buffer
    "h" 'help-command))

  

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)  
   (python . t)       
   (shell . t)
   (C . t)
   (makefile . t)
   (matlab . t)
   (haskell . t)
   (latex . t)
   (sql . t)
   (lua . t)
   (java . t)
   (js . t)))        

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
