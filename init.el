(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defun include(relative-path)
  "Load a config file from a relative path in ~/.emacs.d/."
  (load (expand-file-name relative-path user-emacs-directory)))

(include "config/pkgs.el")
(include "config/options.el")
(include "config/ui.el")

(load custom-file 'noerror)

