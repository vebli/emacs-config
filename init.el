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
 '(custom-safe-themes
   '("b1cb7aeccbefaea58b7979562c727855771f2530a776be5d02b80ebdfcda12e6"
     "b8bd60a23b9e2f08b0c437231ee84f2dacc70fdc4d5a0fb87229bb9926273fdd"
     "d002066fd00de31060aa8fdce7f38b181b9b1b0a41dcb0069ccab3dc1ff5d157"
     "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0"
     "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
     default))
 '(package-selected-packages nil))
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
