(use-package project)

(defvar veb/project-locals nil "Project-specific variables")
(put 'veb/project-locals 'safe-local-variable #'listp)

(defun veb/project-run ()
  (interactive)
  (let* ((key (completing-read "Select function to run" (mapcar 'car veb/project-locals)))
	 (default-directory (project-root (project-current t)))
	 (cmd (cdr (assoc key veb/project-locals)) ))
    (async-shell-command cmd)))

(defun veb/project-locals-add (key val)
  "Set key to val in the current project's .dir-locals.el"
  (interactive)
  (add-dir-local-variable nil 'veb/project-locals (push (cons key val) veb/project-locals))
  (message "Set %s in project" key)
  )

(defun veb/project-locals-delete (key)
  (interactive)
  (assoc-delete-all) key veb/project-locals
  (message "Deleted %s" key))

(defun veb/project-locals-generate ()
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (if (file-exists-p "CMakeLists.txt")
	(veb/project-locals-add "cmake build" "cmake ./build"))
    (if (file-exists-p "flake.nix" )
	(veb/project-locals-add "nix run" "nix run"))))

