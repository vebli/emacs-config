(use-package smartparens
  :ensure t
  :hook
  (prog-mode . smartparens-mode)
  ((emacs-lisp-mode
    lisp-mode
    lisp-interaction-mode
    scheme-mode
    clojure-mode) . smartparens-strict-mode)
  :init
  ;; Load default config early
  (require 'smartparens-config)
  :custom
  ;; Visual feedback
  (show-smartparens-delay 0)
  (show-smartparens-style 'parenthesis)

  ;; Behavior tweaks for Lisp
  (sp-indent-after-insert t)
  (sp-escape-quotes-after-insert nil)
  (sp-autoescape-string-quote nil)

  ;; Safer killing / deletion
  (sp-hybrid-kill-entire-symbol nil)
  (sp-delete-pair-in-kill-ring t)
  (sp-navigate-consider-symbols t)
  :config
  (sp-use-paredit-bindings)
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'lisp-mode "'" nil :actions nil)
  (sp-local-pair 'clojure-mode "'" nil :actions nil))

