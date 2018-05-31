;; Stuff used at work only

(load-file "~/.spacemacs.d/neuron-emacs/nmodl.el")
(load-file "~/.spacemacs.d/neuron-emacs/nrnhoc.el")

(setq auto-mode-alist (cons '("\\.hoc\\'" . nrnhoc-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mod\\'" . nmodl-mode) auto-mode-alist))

(setq neurolucida-mode-hook nil)
(define-derived-mode neurolucida-mode clojure-mode "NEUROLUCIDA"
  "major mode for editing mymath language code.")
(add-to-list 'auto-mode-alist '("\\.asc\\'" . neurolucida-mode))

(defun neurolucida-find-duplicates ()
  (interactive)
  (re-search-forward " ( +\\(-?[0-9.]+\\) +\\(-?[0-9.]+\\) +\\(-?[0-9.]+\\).*\n *( +\\1 +\\2 +\\3"))


(define-derived-mode h5-mode fundamental-mode "H5"
  "major mode for editing mymath language code.")
(add-to-list 'auto-mode-alist '("\\.h5\\'" . h5-mode))

(defun h5dump ()
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (kill-buffer name)

    (let ((new-buffer (get-buffer-create (generate-new-buffer-name name t))))
      (switch-to-buffer new-buffer)
      (shell-command
       (concat "h5dump " filename)
       new-buffer
       )
      (toggle-read-only)))
  )

(add-hook 'h5-mode-hook 'h5dump)
