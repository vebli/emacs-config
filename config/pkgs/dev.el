
(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (nix-mode . lsp-deferred)
        (python-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  ;(setq lsp-prefer-flymake nil)
(lsp-enable-which-key-integration t))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

; CPP
(use-package modern-cpp-font-lock
  :ensure t
  :hook (c++-mode . modern-c++-font-lock-mode))

