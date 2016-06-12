(transient-mark-mode t) ;pour que la region selectionnee soit mise en surbrillance

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
(load-file "~/.emacs.d/setup-linux-config.el")


;;Nom de la fonction dans la barre
(which-function-mode 1)

;;Incrementer des nombres
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(setq org-directory "~/notes")
(setq org-agenda-files '("second.org" "jazz.org" "poleEmploi.org" "google.org" "muscu.org" "rando.org" "test.org")) ;; List of org-files to be used for creating the agenda view
(setq org-mobile-agenda 'default)
(setq org-mobile-directory "~/Dropbox/mobileOrg-benoit") ;; The sync repository
(setq org-mobile-inbox-for-pull "~/Dropbox/mobileOrg-benoit/from-mobile.org") ;; The filename for new notes created from the MobileOrg app


;; Display column number
(setq column-number-mode t)

(defun forLoop ()
  "Insert a template of for loop"
  (interactive)
  (insert "for(int i = 0;i<N;++i){\n\n\t}"))

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

;; (tool-bar-mode -1)
;; (tooltip-mode nil)
;; (setq tooltip-use-echo-area nil)

(setq set-mark-command-repeat-pop t)

;; (dolist (command '(yank yank-pop))
;;   (eval `(defadvice ,command (after indent-region activate)
;;            (and (not current-prefix-arg)
;;                 (member major-mode '(emacs-lisp-mode lisp-mode
;;                                                      clojure-mode    scheme-mode
;;                                                      haskell-mode    ruby-mode
;;                                                      rspec-mode      python-mode
;;                                                      c-mode          c++-mode
;;                                                      objc-mode       latex-mode
;;                                                      plain-tex-mode))
;;                 (let ((mark-even-if-inactive transient-mark-mode))
;;                   (indent-region (region-beginning) (region-end) nil))))))

(defun my-recompile ()
  "Run compile and resize the compile window closing the old one if necessary"
  (interactive)
  (progn
    ;; (if (get-buffer "*compilation*") ; If old compile window exists
    ;;     (progn
    ;;       (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
    ;;       (kill-buffer "*compilation*") ; and kill the buffers
    ;;       )
    ;;   )
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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(gdb-many-windows t)
 '(jabber-account-list
   (quote
    (("ben.coste@gmail.com"
      (:network-server . "talk.google.com")
      (:port . 5223)
      (:connection-type . ssl)))))
 '(mail-host-address "gmail.com")
 '(org-agenda-files nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-mail-address "ben.coste@gmail.com")
 '(smtpmail-smtp-server "smtp.gmail.com" t)
 '(smtpmail-smtp-service 25)
 '(smtpmail-smtp-user "ben.coste@gmail.com")
 '(user-full-name "Benoît Coste")
 '(user-mail-address "ben.coste@gmail.com"))

(setq gnus-select-method
      '(nnimap "gmail"
           (nnimap-address "imap.gmail.com")
           (nnimap-server-port 993)
           (nnimap-stream ssl)))


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

  (let* ((str         (substring-no-properties (car kill-ring)))
         (strNoQuotes (replace-regexp-in-string "\"" "" str)))
    (insert (concat "std::cout << \"" strNoQuotes " : \" << " str " << std::endl;"))))

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

(defun insert-javascript-inspector()
  (interactive)
  (insert                  
   "function xinspect(o,i){
    if(typeof i=='undefined')i='';
    if(i.length>50)return '[MAX ITERATIONS]';
    var r=[];
    for(var p in o){
        var t=typeof o[p];
        r.push(i+'\"'+p+'\" ('+t+') => '+(t=='object' ? 'object:'+xinspect(o[p],i+'  ') : o[p]+''));
    }
    return r.join(i+'\\n');
    }
    "))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

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
(global-set-key (kbd "C-c m") 'overwrite-mode)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x <f2>") 'switch-to-ansi-term-and-goto-current-directory)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)




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



;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587 "ben.coste" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       )


(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


(global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(electric-pair-mode 1)

(add-hook
 'c++-mode-hook
 '(lambda()
    ;; We could place some regexes into `c-mode-common-hook', but note that their evaluation order
    ;; matters.
    (font-lock-add-keywords
     nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; namespace names and tags - these are rendered as constants by cc-mode
           ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
           ;;  new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
           ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
           ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; c++11 string literals
           ;;       L"wide string"
           ;;       L"wide string with UNICODE codepoint: \u2018"
           ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
           ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
           ;;       R"(user-defined literal)"
           ;;       R"( a "quot'd" string )"
           ;;       R"delimiter(The String Data" )delimiter"
           ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
           ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
           (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
           (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

           ;; user-defined types (rather project-specific)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
    ) t)

(defun init.d()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

;; Yasnippet conflict with ansi-term tab completion so we de-activate it
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

;; Don't ask confirmation before closing ansi-term
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))

(add-hook 'term-exec-hook 'set-no-process-query-on-exit)
