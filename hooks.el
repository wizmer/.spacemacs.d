(require 'py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'python-mode-hook (lambda () (setq forward-sexp-function nil)))

(add-hook 'cmake-mode-hook (lambda () (evil-local-set-key 'normal "q" 'quit-window )))
;; (add-hook 'before-save-hook 'py-isort-before-save)

;; Always save before sending to buffer
(advice-add 'python-shell-send-buffer :before #'save-buffer)

(add-to-list 'auto-mode-alist '("\\.asc\\'" . fundamental-mode))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(defun clang-format-on-save ()
    (add-hook 'before-save-hook 'clang-format-buffer nil t))
;; (add-hook 'c++-mode-hook 'clang-format-on-save)
(remove-hook 'c-mode-common-hook 'spacemacs//c-toggle-auto-newline )

;; To properly indent hoplon macros. The following is extended from Alan's dotspacemacs:
(add-hook 'clojure-mode-hook
          '(lambda ()
             ;; Hoplon functions and macros
             (dolist (pair '((page . 'defun)
                             (loop-tpl . 'defun)
                             (if-tpl . '1)
                             (for-tpl . '1)
                             (case-tpl . '1)
                             (cond-tpl . 'defun)))
               (put-clojure-indent (car pair)
                                   (car (last pair))))))


;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

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

;; Don't ask confirmation before closing ansi-term
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))
(add-hook 'term-exec-hook 'set-no-process-query-on-exit)

(defun char-mode-and-enter()
  "Go back to char-mode before pressing enter"
  (interactive)
  (term-char-mode)
  (term-send-raw))
(add-hook 'term-mode-hook
          (function
           (lambda ()
             (clean-aindent-mode -1) ;; Disable clean-aindent as it breaks M-backspace in ansi-term
             )))

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (when (and
         (buffer-live-p buffer)
         (string-match "compilation" (buffer-name buffer))
         (string-match "finished" string)
         (not
          (with-current-buffer buffer
            (goto-char (point-min))
            (search-forward "warning" nil t))))
    (run-with-timer 4 nil
                    (lambda (buf)
                      (bury-buffer buf)
                      (switch-to-prev-buffer (get-buffer-window buf) 'kill))
                    buffer)))
;; (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
