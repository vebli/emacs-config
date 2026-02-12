(use-package visual-fill-column
  :init 
  (setq visual-fill-column-width 120 
	visual-fill-column-center-text t)  
  )
(use-package org
  :pin gnu  
  :hook
  ((org-mode . org-latex-preview-auto-mode)
   (org-mode . font-lock-mode)
   (org-mode . variable-pitch-mode)
   (org-mode . visual-fill-column-mode)
   (org-mode . visual-line-mode))
  :init
  (setq ;;org-startup-with-inline-images t
	;; org-startup-with-latex-preview t
	org-confirm-babel-evaluate nil
	org-hide-emphasis-markers t
	org-preview-latex-default-process 'dvisvgm
	org-preview-latex-process-alist
	'((dvisvgm
	   :programs ("latex" "dvisvgm")
	   :description "dvi -> svg"
	   :message "you need latex and dvisvgm"
	   :use-xcolor t
	   :image-input-type "dvi"
	   :image-output-type "svg"
	   :image-size-adjust (1.7 . 1.5)
	   :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
	   :image-converter ("dvisvgm %f -n -b min -c %S -o %O")))
	org-babel-load-languages
	'((emacs-lisp . t)  
	  (python . t)       
	  (shell . t)
	  (C . t)
	  (makefile . t)
	  (latex . t)
	  (sql . t)
	  ))
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.8))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))



(use-package org-roam
  :after org
  :hook (org-roam-mode . org-roam-db-autosync-mode)
  :init (setq org-roam-v2-ack t
	      org-roam-directory (file-truename "~/Sync/Org")
	      org-roam-dailies-directory (file-truename "~/Sync/Org/journal/daily/")
	      org-roam-complete-everywhere t
	      ))

(use-package ob-sagemath
  :after org-roam
  :config
  (setq org-babel-default-header-args:sage '((:session . t)
                                             (:results . "output latex"))))


;; (use-package org
;;   :pin gnu  
;;   :hook (org-mode . vebly/org-mode-setup)
;;   :custom
;;   (org-startup-with-inline-images t)
;;   (org-startup-with-latex-preview t)
;;   (org-ellipsis " ⬎")
;;   ;(org-latex-preview-default-process 'dvisvgm)
;;   ;(org-hide-emphasis-markers t)
;;   ;(org-agenda-start-with-log-mode t)
;;   ;(org-log-done 'time)
;;   ;(org-log-into-drawer t) 
;;   (org-agenda-files
;; 	(seq-filter (lambda (file) (not (string-match "/\\.#" file)))
;; 		    (append (directory-files-recursively "~/org/Agenda/" "\\.org$")
;; 			    (directory-files-recursively "~/org/Projects/" "\\.org$")
;; 			    (directory-files-recursively "~/org/Permanent/" "\\.org$")
;; 			    (directory-files-recursively "~/org/Fleeting/" "\\.org$"))))
;;   :config
;;   (defun vebly/org-latex-refresh ()
;;     "Refresh LaTeX preview when cursor leaves the equation."
;;     (when (org-inside-LaTeX-fragment-p)
;;       (org-latex-preview)
;;       (redisplay))) ;; Ensures smooth update

;;   (defun vebly/org-mode-visual-fill ()
;;     "Set up `visual-fill-column' for Org mode."
;;     (setq visual-fill-column-width 120 
;; 	  visual-fill-column-center-text t)  
;;     (visual-fill-column-mode 1))

;;   (defun vebly/org-mode-setup ()
;;     "Custom orgmode hook"
;;     (visual-line-mode 1) ; Enable soft line wrapping
;;     (vebly/org-mode-visual-fill) ; from visual-fill-column package
;;     (add-hook 'post-command-hook #'vebly/org-latex-refresh nil t)
;;     )

;;   (require 'org-habit)
;;   (add-to-list 'org-modules 'org-habit)
;;   (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;;   (custom-theme-set-faces
;;    'user
;;    '(org-block ((t (:inherit fixed-pitch))))         ;; Code blocks
;;    '(org-code ((t (:inherit fixed-pitch))))          ;; Inline code
;;    '(org-table ((t (:inherit fixed-pitch))))         ;; Tables
;;    '(org-verbatim ((t (:inherit fixed-pitch))))      ;; Verbatim text
;;    '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch))))) ;; Meta lines
;;    '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch))))) ;; Keywords
;;    )

;;   (dolist (face '((org-level-1 . 1.2)
;; 		(org-level-2 . 1.15)
;; 		(org-level-3 . 1.1)
;; 		(org-level-4 . 1.05)
;; 		(org-level-5 . 1.0)
;; 		(org-level-6 . 0.95)
;; 		(org-level-7 . 0.9)
;; 		(org-level-8 . 0.85)))
;;     (set-face-attribute (car face) nil :font "Inter" :height (cdr face)
;;     ))
;; )

;; (use-package org-roam
;;   :after org
;;   :init (setq org-roam-v2-ack t)
;;   :custom
;;   (org-roam-directory (file-truename "~/org"))
;;   (org-roam-dailies-directory (file-truename "~/org/Journal/Dailies/"))
;;   (org-roam-complete-everywhere t)
;;   (org-roam-capture-templates
;;    '(("d" "default" plain "%?"
;;       :if-new (file+head "Permanent/${title}.org" "#+title: ${title}\n")
;;       :unnarrowed t)

;;      ("p" "Projects" plain "%?"
;;       :if-new (file+head "Projects/${title}/${title}.org" "#+title: 0-${title}\n")
;;       :unnarrowed t)
;;      )
;;    )

;;   (org-roam-dailies-capture-templates
;;    '(("d" "default" plain "* %?"
;;       :target (file+head "%<%Y-%m-%d>.org"
;; 			 "#+title: %<%Y-%m-%d>\n")))
;;    )
;;   :bind
;;   (("C-c n l" . org-roam-buffer-toggle)
;;    ("C-c n f" . org-roam-node-find)
;;    ("C-c n i" . org-roam-node-insert))
;;   :config
;;   (org-roam-db-autosync-mode)
;; )

;; (use-package org-modern
;;   :after org
;;   :hook (org-mode . org-modern-mode)
;;   )
  
(use-package org-download
  :after org
  :hook
  (dired-mode . org-download-enable)
  :custom
  (org-download-image-dir "~/org/resources/images/")
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  )

(use-package openwith
  :after org
  :hook (org-mode . (lambda () (openwith-mode 1)))
  :custom
  (openwith-associations
        '(("\\.pdf\\'" "okular" (file))
	  ("\\.xoop\\'" "xournalpp" (file))
          ("\\.mp3\\'" "mpv" (file))))
  )


