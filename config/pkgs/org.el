(use-package org
  :ensure t  
  :pin gnu  
  :config
  (setq 
        org-startup-indented t   
        org-startup-with-inline-images t
        org-startup-with-latex-preview t
        org-latex-preview-default-process 'dvisvgm
        org-ellipsis " ⬎"
        org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;  (defun my/org-latex-refresh ()
;    "Refresh LaTeX preview when cursor leaves the equation."
;    (when (org-inside-LaTeX-fragment-p)
;      (org-latex-preview)
;      (redisplay))) ;; Ensures smooth update
;
;(add-hook 'post-command-hook #'my/org-latex-refresh)
)


(use-package org-roam
  :ensure t
  :after org
  :custom
  (org-roam-directory (file-truename "~/org"))
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-mode))

(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode))
  
(use-package org-download
  :ensure t
  :after org
  :hook
  (dired-mode . org-download-enable)
  :config
  (setq-default org-download-image-dir "~/org/06\ -\ Resources/Images")
  (setq org-download-timestamp "%Y%m%d-%H%M%S_")
  )


(use-package openwith
  :ensure t
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
                                             (:results . "output latex"))))
