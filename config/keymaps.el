
  (general-create-definer leader
    :states '(normal visual motion) ;; Define states here
    :keymaps 'override  ;; Ensures it works globally
    :prefix "SPC")  ;; Sets Space as leader key

  (general-create-definer leader-lsp
    :states '(normal) ;; Define states here
    :keymaps 'lsp-mode-map ;; Ensures it works globally
    :prefix "SPC")  ;; Sets Space as leader key

  (leader
    "mx" '(counsel-M-x :which-key "Execute command")
    "ff" '(find-file :which-key "Find file")
    "bn" '(next-buffer :which-key "Next buffer")
    "bp" '(previous-buffer :which-key "Previous buffer")
    "bm" '(counsel-switch-buffer :which-key "List buffers")
    "h" '(help-command :which-key "Help")
    )

  (with-eval-after-load 'lsp-mode (leader-lsp
    "rn" '(lsp-rename :which-key "Rename Symbol")
    "gd" '(lsp-find-definition :which-key "Go to definition")
    "gr" '(lsp-find-references :which-key "Find references")
    ))
