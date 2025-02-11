(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))

(unless (server-running-p)
  (server-start))
(setq server-window 'pop-to-buffer)
(setq create-lockfiles nil)  ;; Stop Emacs from creating .# lock files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))) ;Don't clutter work space with backup filesw
(setf dired-kill-when-opening-new-dired-buffer t)

;; Ensure a clean startup with emacs --daemon
(setq desktop-save-mode nil)  ;; Prevents saving/restoring sessions
(setq inhibit-startup-screen t)  ;; No splash screen
(setq initial-buffer-choice nil) ;; No default buffer
(setq after-init-hook (lambda () (kill-buffer "*scratch*"))) ;; No scratch buffer
