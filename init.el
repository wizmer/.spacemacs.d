;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load CEDET.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another
;; package (Gnus, auth-source, ...).
;;(load-file "~/appz/cedet-1.1/common/cedet.el")

;; Enable EDE (Project Management) features
;;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of Load CEDET.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'iso-transl)

(set-face-attribute  'mode-line
                     nil
                     :foreground "gray80"
                     :box '(:line-width 1 :style released-button))

(set-face-attribute  'mode-line-inactive
                     nil
                     :foreground "green"
                     :box '(:line-width 1 :style released-button))

;;(set-background-color "Black")
;;(set-foreground-color "White")
;;(set-cursor-color "White")

(transient-mark-mode t) ;pour que la region selectionnee soit mise en surbrillance

;;(ffap-bindings)

;; (add-to-list 'load-path "~/.emacs.d/lisp/")

(when (>= emacs-major-version 24)
  (require 'package) ; initialize the package manager
  (package-initialize)
  ;; Archives from which to fetch.
  (setq package-archives
	(append '(("melpa" . "http://melpa.milkbox.net/packages/"))
		package-archives))

)

;; Loading external el files
;; (load-file "~/.emacs.d/elpa/leuven-theme-20150622.306/leuven-theme.el")
;; (load-theme 'leuven t)

(load-file "~/.emacs.d/toggle-source-header.el")


;;Nom de la fonction dans la barre
(which-function-mode 1)

;;Incrementer des nombres
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))


;; Display column number
(setq column-number-mode t)

(defun forLoop ()
  "Insert a template of for loop"
  (interactive)
  (insert "for(int i = 0;i<N;i++){\n\n\t}"))

(setq-default ispell-program-name "aspell")



(which-func-mode 1) ;; print the name of the current function at the bottom of the screen

;; stuff to make the backspace key work in any cases
;; (normal-erase-is-backspace-mode 0)
(global-set-key [?\C-h] 'delete-backward-char)
;; (global-set-key [(control h)] 'delete-backward-char)
;; (global-set-key [delete] 'delete-char)
;; (global-set-key [M-delete] 'kill-word)
;; (global-set-key [?\C-x ?h] 'help-command) ;; overrides mark-whole-buffer


;; let's unleash the power of IDO mode !
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
;;(define-key global-map (kbd "RET") 'newline-and-indent)

(desktop-save-mode 1)

(defun x11-maximize-frame ()
  "Maximize the current frame (to full screen)"
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))


(setq compilation-ask-about-save nil) ;;; Shut up compile saves
;;(setq compilation-save-buffers-predicate '(lambda () nil)) ;;; Don't save *anything*


(setq compilation-read-command nil) ;; do not ask for which command to run every time
(setq compile-command "make") ;; supress the default command : "make -k"
(setq compilation-scroll-output 'first-error)
(setq compilation-always-kill t)

(tool-bar-mode -1)
;; (tooltip-mode nil)
;; (setq tooltip-use-echo-area nil)

(setq set-mark-command-repeat-pop t)

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(defun my-recompile ()
  "Run compile and resize the compile window closing the old one if necessary"
  (interactive)
  (progn
    (if (get-buffer "*compilation*") ; If old compile window exists
        (progn
          (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
          (kill-buffer "*compilation*") ; and kill the buffers
          )
      )
    (call-interactively 'compile)
    )
  )

(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 10)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

;; BACKUP (see http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files)
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; https://twiki.cern.ch/twiki/bin/view/CDS/EmacsTips#B2_Ido

;; Activate disabled commands by default
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(defun switch-to-ansi-term ()
  (interactive)
  (setq termBuffer (get-buffer "*ansi-term*"))
  (if (get-buffer "*ansi-term*")
      (progn
        (setq cur (current-buffer))
        (if (string= (buffer-name cur) "*ansi-term*")
            (switch-to-buffer (other-buffer))
          (switch-to-buffer termBuffer)))
    (ansi-term shell-file-name)))

(setq term-buffer-maximum-size 50000) ;; maximum number of lines in ansi-term

;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(defun xah-open-file-at-cursor ()
    "Open the file path under cursor.
If there is text selection, uses the text selection for path.
If the path starts with “http://”, open the URL in browser.
Input path can be {relative, full path, URL}.
Path may have a trailing “:‹n›” that indicates line number. If so, jump to that line number.
If path does not have a file extention, automatically try with “.el” for elisp files.
This command is similar to `find-file-at-point' but without prompting for confirmation.

URL `http://ergoemacs.org/emacs/emacs_open_file_path_fast.html'"
    (interactive)
    (let ((ξpath (if (use-region-p)
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (let (p0 p1 p2)
                     (setq p0 (point))
                     ;; chars that are likely to be delimiters of full path, e.g. space, tabs, brakets.
                     (skip-chars-backward "^  \"\t\n'|()[]{}<>〔〕“”〈〉《》【】〖〗«»‹›·。\\`")
                     (setq p1 (point))
                     (goto-char p0)
                     (skip-chars-forward "^  \"\t\n'|()[]{}<>〔〕“”〈〉《》【】〖〗«»‹›·。\\'")
                     (setq p2 (point))
                     (goto-char p0)
                     (buffer-substring-no-properties p1 p2)))))
      (if (string-match-p "\\`https?://" ξpath)
          (browse-url ξpath)
        (progn ; not starting “http://”
          (if (string-match "^\\`\\(.+?\\):\\([0-9]+\\)\\'" ξpath)
              (progn
                (let (
                      (ξfpath (match-string 1 ξpath))
                      (ξline-num (string-to-number (match-string 2 ξpath))))
                  (if (file-exists-p ξfpath)
                      (progn
                        (find-file ξfpath)
                        (goto-char 1)
                        (forward-line (1- ξline-num)))
                    (progn
                      (when (y-or-n-p (format "file doesn't exist: 「%s」. Create?" ξfpath))
                        (find-file ξfpath))))))
            (progn
              (if (file-exists-p ξpath)
                  (find-file ξpath)
                (if (file-exists-p (concat ξpath ".el"))
                    (find-file (concat ξpath ".el"))
                  (when (y-or-n-p (format "file doesn't exist: 「%s」. Create?" ξpath))
                    (find-file ξpath ))))))))))


(defun run()
  (interactive)
  ;; (goto-char (point-min) )
  (setq name (buffer-name))
  (setq path (file-name-directory(buffer-file-name)))
  (setq s (buffer-substring-no-properties 1 9) )

  (if (string= major-mode "python-mode")
      (progn
        (save-buffer)
        (switch-to-ansi-term)
        (move-beginning-of-line nil)
        (insert (kbd "C-c C-c"))
        (term-send-input)
        (insert "cd ")
        (insert path)
        (term-send-input)
        (insert "ipython ")
        (insert name)
        (term-send-input))
    (progn
      (if (string= s "// macro")
          (progn
            (save-buffer)
            (switch-to-ansi-term)
            ;; (term-send-raw)
            (move-beginning-of-line nil)
            (insert ".q")
            (term-send-input)
            (insert "cd ")
            (insert path)
            (term-send-input)
            (insert "r ")
            (insert name)
            (insert "++O")
            (term-send-input))
        (my-recompile)))
    ))

(defun pwd ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gdb-many-windows t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-mail-address "ben.coste@gmail.com")
 '(smtpmail-smtp-user "ben.coste@gmail.com")
 '(smtpmail-smtp-service 25))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun my_cout()
  (interactive)
  (move-beginning-of-line nil)
  (c-indent-line-or-region)
  (kill-line)
  (insert "std::cout << \"")
  (yank)
  (insert " : \" << ")
  (yank)
  (insert " << std::endl;"))

(defun insert-cout (message)
  (interactive "sMessage to cout ? ")
  (c-indent-line-or-region)
  (insert "std::cout << \"")
  (insert message)
  (insert "\" << std::endl;")
  (newline-and-indent))

(defun switch-to-ansi-term-and-goto-current-directory ()
  (interactive)
  (setq termBuffer (get-buffer "*ansi-term*"))
  (setq name (buffer-name))
  (setq path (file-name-directory(buffer-file-name)))
  (if (get-buffer "*ansi-term*")
      (progn
        (setq cur (current-buffer))
        (if (string= (buffer-name cur) "*ansi-term*")
            (switch-to-buffer (other-buffer))
          (progn
            (switch-to-buffer termBuffer)
            (insert "cd ")
            (insert path)
            (term-send-input)
            )))))



(put 'narrow-to-region 'disabled nil)

;; indenting stuff
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)



(defun copy-quoted-text-at-point ()
  (interactive)
  (let ((delim '("\'" "\"" "\`"))
        (start 0)
        (theDelim "")
        (p0 (point)))
    (dolist (elt delim)
      (setq startTmp (search-backward elt nil t) )
      (goto-char p0)
      (if (numberp startTmp)
          (if (< start startTmp)
              (progn
                (setq theDelim elt)
                (setq start (+ startTmp 1))))))
    (forward-char)
    (setq end (- (search-forward theDelim) 1))
      (kill-ring-save start end)))

(defun toggle-boolean-at-point()
  (interactive)
  (let ((str (thing-at-point 'word)))
    (setq bounds (bounds-of-thing-at-point 'symbol))
    (setq pos1 (car bounds))
    (setq pos2 (cdr bounds))
    (if (string= str "True")
        (progn
          (delete-region pos1 pos2)
          (insert "False")
          ))
    (if (string= str "False")
        (progn
          (delete-region pos1 pos2)
          (insert "True")
          ))
    ))

(defun find-regex-in-all-buffers (regexp)
  (interactive "sSearch for regexp ? ")
  (multi-occur-in-matching-buffers ".*" regexp))

(global-set-key (kbd "M-.") 'up-list) ;; Go out of the block of (),{} ... by the top
(global-set-key (kbd "M-,") 'backward-up-list) ;; Go out of the block of (),{} ... by the bottom
(global-set-key [f1] 'run)
(global-set-key [f2] 'switch-to-ansi-term)
(global-set-key [f7] 'forLoop)
(global-set-key [f8] 'replace-string)
(global-set-key [f9] 'toggle-source-header)
(global-set-key [f10] 'find-regex-in-all-buffers)
(global-set-key [f11] 'x11-maximize-frame)
(global-set-key [f12] 'my_cout)
(global-set-key (kbd "C-o") 'goto-line)
(global-set-key [C-/] 'undo)
(global-set-key (kbd "§") 'other-window)
(global-set-key (kbd "C-c +") 'increment-number-at-point)
(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "C-x j") 'ansi-term)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-c o") 'insert-cout)
(global-set-key (kbd "C-c w") 'copy-quoted-text-at-point)
(global-set-key (kbd "C-x <f2>") 'switch-to-ansi-term-and-goto-current-directory)

(add-hook 'python-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'toggle-boolean-at-point)))

;; activate View Mode for all read-only files
(setq view-read-only t)

(defun send-to-header ()
  (interactive)
  (setq equalSign (search-forward "=" (line-end-position) t))
  ;;(let ((equalSign nil)))

  (defun do-send ()
    (interactive)
    (end-of-line)
    (newline-and-indent)
    (yank)
    (whitespace-cleanup-region (line-beginning-position) (line-end-position))
    (insert ";")
    (save-buffer)
    (toggle-source-header)
    (backward-sexp)
    (kill-region (line-beginning-position) (point))
    (indent-for-tab-command)
    )
  
  (if equalSign
      (progn 
        (kill-ring-save (line-beginning-position) (- equalSign 1))
        (toggle-source-header)
        (goto-char 1)

        (cond ((search-forward-regexp "\\bprivate\\b\[ \\t\]\*:" (point-max) t)   (do-send))
              ((search-forward-regexp "\\bprotected\\b\[ \\t\]\*:" (point-max) t) (do-send))
              ((search-forward-regexp "\\bpublic\\b\[ \\t\]\*:" (point-max) t) (do-send))
              ((search-forward-regexp "\\bclass\\b\.\*:" (point-max) t) (do-send))
              )
        )
    )
  )

(defun my-update-env ()
  (interactive)
  (let ((str 
         (with-temp-buffer
           (insert-file-contents "env.txt")
           (buffer-string))) lst)
    (setq lst (split-string str "\000"))
    (while lst
      (setq cur (car lst))
      (when (string-match "^\\(.*?\\)=\\(.*\\)" cur)
        (setq var (match-string 1 cur))
        (setq value (match-string 2 cur))
        (setenv var value))
      (setq lst (cdr lst)))))


(add-hook 'term-mode-hook
          (function
           (lambda ()
             (define-key term-raw-map [?\C-c prior] 'scroll-down)
             (define-key term-raw-map [?\C-c next] 'scroll-up))))



