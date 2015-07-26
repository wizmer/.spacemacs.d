(defvar c++-header-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\|\par\\)$")
(defvar c++-source-ext-regexp "\\.\\(cpp\\|c\\|\cc\\|C\\|\par\\)$")
(defvar c++-default-header-ext "hpp")
(defvar c++-default-source-ext "cpp")
(defvar c++-source-extension-list '("c" "cc" "C" "cpp" "par"))
(defvar c++-header-extension-list '("h" "hh" "H" "hpp" "par"))

(defun toggle-source-header()
  "Switches to the source buffer if currently in the header buffer and vice versa."
  (interactive)
  (let ((buf (current-buffer))
	(name (file-name-nondirectory (buffer-file-name)))
	file
	offs)
    (setq offs (string-match c++-header-ext-regexp name))
    (if offs
	(let ((lst c++-source-extension-list)
	      (ok nil)
	      ext)
	  (setq file (substring name 0 offs))
	  (while (and lst (not ok))
	    (setq ext (car lst))
	    (if (get-buffer (concat file "." ext))
		(progn ; Lets you evaluate more than one sexp for the true case
		  (setq ok t)
		  (switch-to-buffer (concat file "." ext))))
	    (if (file-exists-p (concat file "." ext))
		(progn ; Lets you evaluate more than one sexp for the true case
		  (setq ok t)
		  (find-file (concat file "." ext))))
	    (setq lst (cdr lst))))
      (let ()
	(setq offs (string-match c++-source-ext-regexp name))
	(if offs
	    (let ((lst c++-header-extension-list)
		  (ok nil)
		  ext)
	      (setq file (substring name 0 offs))
	      (while (and lst (not ok))
		(setq ext (car lst))
		(if (get-buffer (concat file "." ext))
		    (progn
		      (setq ok t)
		      (switch-to-buffer (concat file "." ext))))
		(if (file-exists-p (concat file "." ext))
		    (progn
		      (setq ok t)
		      (find-file (concat file "." ext))))
		(setq lst (cdr lst)))))))))
