  (general-create-definer leader-lsp
    :states '(motion) ;; Define states here
    :keymaps 'override  ;; Ensures it works globally
    :prefix "SPC")  ;; Sets Space as leader key


  (general-create-definer leader
    :states '(normal visual motion) ;; Define states here
    :keymaps 'override  ;; Ensures it works globally
    :prefix "SPC")  ;; Sets Space as leader key

  (leader
    "ff" 'find-file
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "bm" 'counsel-switch-buffer
    "h" 'help-command
    "rn" 'lsp-rename
    )

  (leader-lsp
    "rn" 'lsp-rename
    "gd" 'lsp-find-definition
    "gr" 'lsp-find-references
    )
