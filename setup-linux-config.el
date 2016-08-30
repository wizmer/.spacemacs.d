(defun setup-linux-config ()
  (interactive)

  (let* ((backup-dir (expand-file-name (concat default-directory "linux-config/")))
        (file-list (directory-files backup-dir nil "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)"))
        (home-dir "~/"))
    (dolist (file file-list)
        (copy-file (concat backup-dir file) (concat home-dir file) 0)
      )

    ))
