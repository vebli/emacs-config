(defun include(relative-path)
  "Load a config file from a relative path in ~/.emacs.d/."
  (load (expand-file-name relative-path user-emacs-directory)))


(include "config/pkgs.el")
(include "config/ui.el")
(include "config/options.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(toggle-term term-toggle visual-fill-column ob-sagemath helpful counsel ivy-rich rainbow-delimiters openwith org-download evil-collection magit doom-themes modern-cpp-font-lock company lsp-ui lsp-mode org-roam general evil-org ivy evil command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit fixed-pitch))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-verbatim ((t (:inherit fixed-pitch)))))
