;; unbind some emacs keys
(dolist (k '("C-p" "C-n" "C-f" "C-b" "C-a" "C-e"
             "C-k" "C-d" "C-j" "C-o" "C-w" "M-d" "M-DEL" "M-l" "M-u" "M-c"
	     "C-?" "C-/" "C-_" "C-SPC"
	     ))
  (global-unset-key (kbd k)))

(global-set-key (kbd "C-/") help-map)

;; window navigation
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-l") 'windmove-right)

;;Lsp
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "C-SPC") 'company-complete))


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
  "fp" #'project-switch-project
  "bn" '(next-buffer :which-key "Next buffer")
  "bp" '(previous-buffer :which-key "Previous buffer")
  "bm" '(counsel-switch-buffer :which-key "List buffers")
  "h" '(help-command :which-key "Help")
  "nh" '(evil-ex-nohighlight :which-key "Remove highlights")
  "x" '(:ignore t)
  "xx" '(eval-last-sexp :which-key "eval sexp")
  "xb" '(eval-buffer :which-key "eval buffer")
  )

(with-eval-after-load 'lsp-mode
  (leader-lsp
    "rn" '(lsp-rename :which-key "Rename Symbol")
    "gd" '(lsp-find-definition :which-key "Go to definition")
    "gr" '(lsp-find-references :which-key "Find references")
    "gi" '(lsp-find-implementation :which-key "Find implementation")
    "gt" '(lsp-find-type-definition :which-key "Find type definition")
    "fc" 'lsp-clangd-find-other-file
    "K" 'lsp-ui-doc-glance
    "td" 'flymake-show-project-diagnostics
    "]g" 'flymake-goto-next-error
    "[g" 'flymake-goto-prev-error
    "la" '(lsp-execute-code-action :which-key "Code action")
    "lf" 'lsp-format-buffer
    "lh" 'lsp-treemacs-call-hierarchy
    "ls" 'lsp-treemacs-symbols
    )
  )


(evil-ex-define-cmd "q" 
  (lambda ()
    "Close window and kill buffer, like in Vim."
    (interactive)
    (kill-buffer)
    (if (> (count-windows) 1)
	(delete-window)
    (previous-buffer))))
