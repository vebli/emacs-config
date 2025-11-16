(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; or your preferred prefix
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (nix-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (haskell-mode . lsp-deferred)
         (lsp-mode . flymake-mode)
         (lsp-mode . lsp-enable-which-key-integration)) ;; Enable which-key integration for LSP
  :commands (lsp lsp-deferred))

(use-package dap-mode
  :hook (dap-mode))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package treemacs
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :after (lsp-mode treemacs))


(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

; CPP
(use-package modern-cpp-font-lock
  :ensure t
  :hook (c++-mode . modern-c++-font-lock-mode))

