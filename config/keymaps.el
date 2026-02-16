;; unbind some emacs keys
(dolist (k '("C-p" "C-n" "C-f" "C-b" "C-a" "C-e" "C-t"
             "C-k" "C-d" "C-j" "C-o" "C-w" "M-d" "M-DEL" "M-l" "M-u" "M-c"
	     "C-?" "C-/" "C-_" "C-SPC" "C-s"
	     ))
  (global-unset-key (kbd k)))
(global-set-key (kbd "C-/") help-map)

;; window navigation
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-c C-t") #'toggle-term-vterm)

(define-key vterm-mode-map (kbd "C-h") 'windmove-left)
(define-key vterm-mode-map (kbd "C-j") 'windmove-down)
(define-key vterm-mode-map (kbd "C-k") 'windmove-up)
(define-key vterm-mode-map (kbd "C-l") 'windmove-right)

;; completion
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "C-SPC") 'company-complete))

;; Tmux style keybinds
(defvar veb/tmux-map
  (let ((map (make-sparse-keymap)))
    map)
  "Tmux-style prefix map bound to C-s.")
(global-set-key (kbd "C-s") veb/tmux-map)
(define-key veb/tmux-map (kbd "c") #'tab-bar-new-tab)
(define-key veb/tmux-map (kbd ",") #'tab-bar-rename-tab)
(define-key veb/tmux-map (kbd "&") #'tab-bar-close-tab)
(define-key veb/tmux-map (kbd "n") #'tab-bar-switch-to-next-tab)
(define-key veb/tmux-map (kbd "p") #'tab-bar-switch-to-prev-tab)
(dotimes (i 9)
  (define-key veb/tmux-map (kbd (number-to-string (1+ i)))
    `(lambda () (interactive)
       (tab-bar-select-tab ,(1+ i)))))
(define-key veb/tmux-map (kbd "%") #'split-window-right)
(define-key veb/tmux-map (kbd "\"") #'split-window-below)
(define-key veb/tmux-map (kbd "x") #'delete-window)
(define-key veb/tmux-map (kbd "H") #'shrink-window-horizontally)
(define-key veb/tmux-map (kbd "L") #'enlarge-window-horizontally)
(define-key veb/tmux-map (kbd "J") #'shrink-window)
(define-key veb/tmux-map (kbd "K") #'enlarge-window)

;; Vim style keybinds
(with-eval-after-load 'evil
  ;; Normal + Visual
  (evil-define-key '(normal visual) smartparens-mode-map
    ")" #'sp-forward-sexp
    "(" #'sp-backward-sexp
    "]" #'sp-down-sexp
    "[" #'sp-backward-up-sexp

    ">)" #'sp-forward-slurp-sexp
    "<)" #'sp-forward-barf-sexp
    ">(" #'sp-backward-slurp-sexp
    "<(" #'sp-backward-barf-sexp

    "gt" #'sp-transpose-sexp
    "gT" #'sp-transpose-hybrid-sexp)

  (evil-define-key 'insert smartparens-mode-map
    (kbd "RET") #'sp-newline))

  ;; SPC leader
(general-create-definer leader
  :states '(normal visual motion) ;; Define states here
  :keymaps 'override  ;; Ensures it works globally
  :prefix "SPC")  ;; Sets Space as leader key

;; (defun veb/project-buffers ()
;;   "Return a list of buffers belonging to the current project."
;;   (when-let ((project (project-current)))
;;     (project-buffers project)))

;; (defun veb/project-next-buffer ()
;;   "Switch to the next buffer in the current project."
;;   (interactive)
;;   (let* ((buffers (veb/project-buffers))
;;          (next (cadr (member (current-buffer) buffers))))
;;     (if next
;;         (switch-to-buffer next)
;;       (message "No next project buffer"))))

;; (defun veb/project-prev-buffer ()
;;   "Switch to the previous buffer in the current project."
;;   (interactive)
;;   (let* ((buffers (reverse (veb/project-buffers)))
;;          (prev (cadr (member (current-buffer) buffers))))
;;     (if prev
;;         (switch-to-buffer prev)
;;       (message "No previous project buffer"))))

(leader
  "mx" '(counsel-M-x :which-key "Execute command")
  "h" '(help-command :which-key "Help")
  "nh" '(evil-ex-nohighlight :which-key "Remove highlights")
  "x" '(:ignore t)
  "xx" '(eval-last-sexp :which-key "eval sexp")
  "xb" '(eval-buffer :which-key "eval buffer")

  "ff" '(project-find-file :which-key "Find file")
  "fl" #'project-find-regexp
  "fr" #'recentf
  "fp" #'project-switch-project
  "bn" '(next-buffer :which-key "Next buffer")
  "bp" '(previous-buffer :which-key "Previous buffer")
  "bm" #'project-switch-to-buffer
  "-" #'(lambda () (interactive) (dired (file-name-directory (buffer-file-name))))
  "(" #'sp-wrap-round
  "[" #'sp-wrap-square
  "{" #'sp-wrap-curly
  ")" #'sp-unwrap-sexp
  "]" #'sp-unwrap-sexp
  "}" #'sp-unwrap-sexp
  )

(general-create-definer leader-lsp
  :states '(normal) 
  :keymaps 'lsp-mode-map 
  :prefix "SPC")  

(with-eval-after-load 'lsp-mode
  (leader-lsp
    "rn" '(lsp-rename :which-key "Rename Symbol")
    "gd" '(lsp-find-definition :which-key "Go to definition")
    "gr" '(lsp-find-references :which-key "Find references")
    "gi" '(lsp-find-implementation :which-key "Find implementation")
    "gt" '(lsp-find-type-definition :which-key "Find type definition")
    "lf" #'format-all-region-or-buffer
    "fc" #'lsp-clangd-find-other-file
    "K" #'lsp-ui-doc-glance
    "td" #'flymake-show-project-diagnostics
    "]g" #'flymake-goto-next-error
    "[g" #'flymake-goto-prev-error
    "la" '(lsp-execute-code-action :which-key "Code action")
    "lh" #'lsp-treemacs-call-hierarchy
    "ls" #'lsp-treemacs-symbols
    )
  )

;; clojure keymaps

(with-eval-after-load 'evil
  ;; Normal + Visual
  (evil-define-key '(normal visual) clojure-mode-map
    "cfa" #'clojure-thread-first-all
    "cfs" #'clojure-thread-first
    "cla" #'clojure-thread-last-all
    "cls" #'clojure-thread-last

    "cu" #'clojure-unwind
    "cu" #'clojure-unwind-all

    "cs(" #'clojure-convert-collection-to-list
    "cs'" #'clojure-convert-collection-to-quoted-list
    "cs[" #'clojure-convert-collection-to-vector
    "cs{" #'clojure-convert-collection-to-map
    "cs#" #'clojure-convert-collection-to-set

    "cml" #'clojure-move-to-let

    "cpl" #'clojure-promote-fn-literal))

(general-create-definer localleader
  :states '(normal visual) 
  :keymaps 'cider-mode-map
  :prefix ",")  

(with-eval-after-load 'cider-mode
  (localleader
   "ee" #'cider-eval-defun-at-point
   "ef" #'cider-eval-file
   "eE" #'cider-eval-region
   "cji" #'cider-jack-in
   "eb" #'cider-load-buffer))

(evil-ex-define-cmd "q" 
		    (lambda ()
		      "Close window and kill buffer, like in Vim."
		      (interactive)
		      (kill-buffer)
		      (if (> (count-windows) 1)
			  (delete-window)
			(previous-buffer))))
