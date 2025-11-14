;; unbind some emacs keys
(dolist (k '("C-p" "C-n" "C-f" "C-b" "C-a" "C-e"
             "C-k" "C-d" "C-j" "C-o" "C-w" "M-d" "M-DEL" "M-l" "M-u" "M-c"
	     "C-?" "C-/" "C-_"
	     ))
  (global-unset-key (kbd k)))

(global-set-key (kbd "C-/") help-map)

;; window navigation
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-l") 'windmove-right)


;; Leader keys
(general-create-definer leader
  :states '(normal visual motion) ;; Define states here
  :keymaps 'override  ;; Ensures it works globally
  :prefix "SPC")  ;; Sets Space as leader key

(general-create-definer leader-lsp
  :states '(normal) ;; Define states here
  :keymaps 'lsp-mode-map ;; Ensures it works globally
  :prefix "SPC")  ;; Sets Space as leader key

;; Vim style keybinds
(leader
  "mx" '(counsel-M-x :which-key "Execute command")
  "ff" '(find-file :which-key "Find file")
  "bn" '(next-buffer :which-key "Next buffer")
  "bp" '(previous-buffer :which-key "Previous buffer")
  "bm" '(counsel-switch-buffer :which-key "List buffers")
  "h" '(help-command :which-key "Help")
  "tt" '(toggle-term-term :which-key "Toggle terminal")
  "x" '(:ignore t :which-key "eval")
  "xx" '(eval-last-sexp :which-key "eval sexp")
  "xb" '(eval-buffer :which-key "eval buffer")
  )

(with-eval-after-load 'lsp-mode
  (leader-lsp
    "rn" '(lsp-rename :which-key "Rename Symbol")
    "gd" '(lsp-find-definition :which-key "Go to definition")
    "gr" '(lsp-find-references :which-key "Find references")
    )
  )

