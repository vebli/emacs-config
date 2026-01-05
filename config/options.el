(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))

(unless (server-running-p)
  (server-start))
(setq server-window 'pop-to-buffer)
(setq create-lockfiles nil)  ; Stop Emacs from creating .# lock files
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t)))

(setf dired-kill-when-opening-new-dired-buffer t)
(setf yes-or-no-p 'y-or-n-p)


(global-auto-revert-mode 1) ; Refreshes buffer when file was changed outside of emacs
(setq global-auto-revert-non-file-buffers t) ; Same refresh for things like dired

;; Ensure a clean startup with emacs --daemon
;; (setq desktop-save-mode nil)  ;; Prevents saving/restoring sessions
;; (setq initial-buffer-choice nil) ;; No default buffer
