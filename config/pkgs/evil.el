(use-package undo-fu
  :ensure t)

(use-package undo-fu-session
  :after undo-fu
  :config
  (setq undo-fu-session-directory "~/.emacs.d/undo")
  (global-undo-fu-session-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-fu)
  (setq evil-search-module 'evil-search)
  (setq evil-ex-search-persistent-highlight t)
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

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (evil-collection-define-key 'normal 'dired-mode-map
    (kbd "RET") 'dired-find-file))

(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-cleverparens
  :ensure t
  :after evil
  :config
  (require 'evil-cleverparens-text-objects))
