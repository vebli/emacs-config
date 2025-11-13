(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install))

(add-hook 'pdf-view-mode-hook
	  (lambda () ;; May need to disable some modes that don't make sense in image view
	    (display-line-number-mode -1)
	    (hl-line-mode -1)))
