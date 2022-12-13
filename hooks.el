(require 'py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'python-mode-hook (lambda () (setq forward-sexp-function nil)))
(add-hook 'python-mode-hook 'hs-hide-initial-comment-block t)
;; (define-key python-mode-map [remap end-of-defun] 'next-function-to-top)

;; (add-hook 'before-save-hook 'pyimport-remove-unused)

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
