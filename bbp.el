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
