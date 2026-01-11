(use-package yasnippet
             :ensure t)

(use-package clojure-mode
             :ensure t)

(use-package cider
  :ensure t
  :init
  (setq cider-repl-display-help-banner nil
	 cider-show-error-buffer t
	 cider-auto-select-error-buffer t)
  :hook (clojure-mode . cider-mode))

(use-package haskell-mode
             :ensure t)
(use-package nix-mode
             :ensure t)
(use-package markdown-mode
             :ensure t)

(use-package lsp-mode
             :ensure t
             :init (setq lsp-completion-provider :capf)
             :hook ((asm-mode . lsp-deferred)
                    (c-ts-mode . lsp-deferred)
                    (c++-ts-mode . lsp-deferred)
                    (cmake-ts-mode . lsp-deferred)
                    (makefile-mode . lsp-deferred)
                    (rust-ts-mode . lsp-deferred)
                    (vhdl-mode . lsp-deferred)
                    (verilog-mode . lsp-deferred)

                    (lua-ts-mode . lsp-deferred)
                    (go-ts-mode . lsp-deferred)
                    (python-ts-mode . lsp-deferred)
                    (java-ts-mode . lsp-deferred)
                    (nix-mode . lsp-deferred)
                    (dockerfile-ts-mode . lsp-deferred)
                    (sh-mode . lsp-deferred)
                    (bash-ts-mode . lsp-deferred)
                    (awk-mode . lsp-deferred)
                    (octave-mode . lsp-deferred)

                    (haskell-mode . lsp-deferred)
                    (clojure-mode . lsp-deferred)
                    (scheme-mode . lsp-deferred)

                    (js-ts-mode . lsp-deferred)
                    (php-ts-mode . lsp-deferred)
                    (typescript-ts-mode . lsp-deferred)
                    (css-ts-mode . lsp-deferred)
                    (html-ts-mode . lsp-deferred)

                    (yaml-ts-mode . lsp-deferred)
                    (json-ts-mode . lsp-deferred)
                    (toml-ts-mode . lsp-deferred)
                    (markdown-mode . lsp-deferred)

                    (lsp-mode . flymake-mode)
                    (lsp-mode . lsp-enable-which-key-integration)) ;; Enable which-key integration for LSP
             :commands (lsp lsp-deferred))

(use-package format-all
             :hook (prog-mode . format-all-mode))

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

