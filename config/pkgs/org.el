(use-package visual-fill-column) 

(use-package org
  :pin gnu  
  :hook (org-mode . vebly/org-mode-setup)
  :custom
  (org-startup-indented t)   
  (org-startup-with-inline-images t)
  (org-startup-with-latex-preview t)
  (org-latex-preview-default-process 'dvisvgm)
  (org-ellipsis " ⬎")
  (org-hide-emphasis-markers t)
  (org-agenda-start-with-log-mode t)
  (org-log-done 'time)
  (org-log-into-drawer t) 
  :config
 (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

  (defun vebly/org-latex-refresh ()
    "Refresh LaTeX preview when cursor leaves the equation."
    (when (org-inside-LaTeX-fragment-p)
      (org-latex-preview)
      (redisplay))) ;; Ensures smooth update

  (defun vebly/org-mode-visual-fill ()
    "Set up `visual-fill-column' for Org mode."
    (setq visual-fill-column-width 120 
	  visual-fill-column-center-text t)  
    (visual-fill-column-mode 1))

  (defun vebly/org-mode-setup ()
    "Custom orgmode hook"
    (org-indent-mode)
    (visual-line-mode 1) ; Enable soft line wrapping
    (vebly/org-mode-visual-fill) ; from visual-fill-column package
    (add-hook 'post-command-hook #'vebly/org-latex-refresh nil t)
    )

  (custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))         ;; Code blocks
   '(org-code ((t (:inherit fixed-pitch))))          ;; Inline code
   '(org-table ((t (:inherit fixed-pitch))))         ;; Tables
   '(org-verbatim ((t (:inherit fixed-pitch))))      ;; Verbatim text
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch))))) ;; Meta lines
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch))))) ;; Keywords
   )


  (dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.15)
		(org-level-3 . 1.1)
		(org-level-4 . 1.05)
		(org-level-5 . 1.0)
		(org-level-6 . 0.95)
		(org-level-7 . 0.9)
		(org-level-8 . 0.85)))
    (set-face-attribute (car face) nil :font "Inter" :height (cdr face)
    ))
)

(use-package org-roam
  :after org
  :init (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/org"))
  (org-roam-dailies-directory (file-truename "~/org/Journal/Dailies/"))
  (org-roam-complete-everywhere t)
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-mode)
  (setq org-roam-capture-templates
    '(("d" "default" plain "%?"
       :if-new (file+head "Permanent/${slug}.org" "#+title: ${title}\n")
       :unnarrowed t)

    ("p" "Projects" plain "%?"
       :if-new (file+head "Projects/${title}/${title}.org" "#+title: 0-${title}\n")
       :unnarrowed t)
      )
    )
  (setq org-roam-dailies-capture-templates
	'(("d" "default" plain "* %?"
	   :target (file+head "%<%Y-%m-%d>.org"
			      "#+title: %<%Y-%m-%d>\n")))
	)
)

(use-package org-modern
  :after org
  :hook (org-mode . org-modern-mode))
  
(use-package org-download
  :after org
  :hook
  (dired-mode . org-download-enable)
  :config
  (setq-default org-download-image-dir "~/org/06\ -\ Resources/Images")
  (setq org-download-timestamp "%Y%m%d-%H%M%S_")
  )


(use-package openwith
  :after org
  :hook (org-mode . (lambda () (openwith-mode 1)))
  :config
  (setq openwith-associations
        '(("\\.pdf\\'" "okular" (file))
          ("\\.mp3\\'" "mpv" (file))))
  )


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)  
   (python . t)       
   (shell . t)
   (C . t)
   (makefile . t)
   (matlab . t)
   (haskell . t)
   (latex . t)
   (sql . t)
   (lua . t)
   (java . t)
   (js . t)))        

(use-package ob-sagemath
  :config
  (setq org-babel-default-header-args:sage '((:session . t)
                                             (:results . "output latex")))
  )
