(defun include(relative-path)
  "Load a config file from a relative path in ~/.emacs.d/."
  (load (expand-file-name relative-path user-emacs-directory)))


(include "config/pkgs.el")
(include "config/ui.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("11819dd7a24f40a766c0b632d11f60aaf520cf96bd6d8f35bae3399880937970" default))
 '(package-selected-packages '(general evil-org ivy evil command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
