;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip t)
     ;; better-defaults
     emacs-lisp
     python
     haskell
     rust
     jabber
     git
     html
     ;; markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(android-mode
                                      clojure-mode
                                      cider
                                      ein
                                      easy-kill
                                      py-autopep8
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         leuven
                         spacemacs-dark
                         spacemacs
                         tango-dark
                         tango
                         monokai
                         zenburn
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido t
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-config () 
  (global-set-key (kbd "M-/") 'hippie-expand-or-yas-insert-snippet)
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key (kbd "M-.") 'up-list) ;; Go out of the block of (),{} ... by the top
  (global-set-key (kbd "M-,") 'backward-up-list) ;; Go out of the block of (),{} ... by the bottom
  (global-set-key [f1] 'run)
  (global-set-key [f2] 'switch-to-ansi-term)
  (global-set-key [f6] 'android-gradle-installDebug)
  (global-set-key [f7] 'recompile)
  (global-set-key [f8] 'replace-string)
  (global-set-key [f10] 'find-regex-in-all-buffers)
  (global-set-key [f11] 'x11-maximize-frame)
  (global-set-key [f12] 'my_cout)
  (global-set-key [C-/] 'undo)
  (global-set-key (kbd "M-o") 'other-window)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x f")   'helm-find-files)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x b")   'helm-buffers-list)
  (global-set-key (kbd "M-y")   'helm-show-kill-ring)
  (global-set-key (kbd "M-i")   'imenu)
  (global-set-key (kbd "C-x j") 'ansi-term)
  (global-set-key (kbd "C-c o") 'insert-cout)
  (global-set-key (kbd "C-c w") 'copy-quoted-text-at-point)
  (global-set-key (kbd "C-c m") 'overwrite-mode)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x <f2>") 'switch-to-ansi-term-and-goto-current-directory)
  (global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
  (global-set-key (kbd "C-c /") 'describe-foo-at-point)

  (require 'py-autopep8)
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

    ;;   "Configuration function for user code.
    ;; This function is called at the very end of Spacemacs initialization after
    ;; layers configuration.
    ;; This is the place where most of your configurations should be done. Unless it is
    ;; explicitly specified that a variable should be set before a package is loaded,
    ;; you should place your code here."

    (global-hl-line-mode -1) ;; Disable current line highlight

    (load-file "~/.spacemacs.d/setup-linux-config.el")
    (load-file "~/.spacemacs.d/edi-mode.el")

    ;;Nom de la fonction dans la barre
    ;; (which-function-mode 1)

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


    (require 'iso-transl)
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
    ;; (global-set-key [(control h)] 'delete-backward-char)
    ;; (global-set-key [delete] 'delete-char)
    ;; (global-set-key [M-delete] 'kill-word)
    ;; (global-set-key [?\C-x ?h] 'help-command) ;; overrides mark-whole-buffer


    ;; (setq inhibit-startup-message t
    ;;       inhibit-startup-echo-area-message t)
    ;;(define-key global-map (kbd "RET") 'newline-and-indent)

    ;; (setq desktop-dirname "~/.spacemacs.d/""")
    ;; (desktop-save-mode 1)



    (defun x11-maximize-frame ()
      "Maximize the current frame (to full screen)"
      (interactive)
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))


    (setq compilation-ask-about-save nil) ;;; Shut up compile saves
    ;;(setq compilation-save-buffers-predicate '(lambda () nil)) ;;; Don't save *anything*


    (setq compilation-read-command t) ;; do not ask for which command to run every time
    (setq compile-command "make") ;; supress the default command : "make -k"
    (setq compilation-scroll-output 'first-error)
    (setq compilation-always-kill t)

    (menu-bar-mode t)
    ;; (tooltip-mode nil)
    ;; (setq tooltip-use-echo-area nil)

    (setq set-mark-command-repeat-pop t)

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

    (add-hook 'java-mode-hook (lambda () (android-mode)))

    ;; BACKUP (see http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files)
    (setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
    (setq backup-by-copying t)
    (setq delete-old-versions t
          kept-new-versions 6
          kept-old-versions 2
          version-control t)

    ;; Activate disabled commands by default
    (put 'upcase-region 'disabled nil)
    (put 'downcase-region 'disabled nil)


    (defun switch-to-ansi-term (&optional term-name)
      (interactive)
      (if (or (string= major-mode "clojure-mode")
              (string= major-mode "cider-repl-mode")
              (string= major-mode "cider-test-report-mode"))
          (setq term-name "*cider-repl refactor-tool*")
          (when (equal term-name nil)
            (setq term-name "*ansi-term*")
            )
       )

      (setq termBuffer (get-buffer term-name))
      (if termBuffer
          (progn
            (if (string= (buffer-name (current-buffer)) term-name)
                (switch-to-buffer (other-buffer))
              (switch-to-buffer termBuffer)))
        (progn
          (ansi-term shell-file-name)
          (rename-buffer term-name)
          )))

    (setq term-buffer-maximum-size 50000) ;; maximum number of lines in ansi-term

    ;; (require 'package)
    ;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

    ;; The following lines are always needed. Choose your own keys.
    (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
    (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

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

      (cond
       ((string= major-mode "clojure-mode")
        (cider-load-buffer)
        (cider-run)
        )
       ((string= major-mode "python-mode")
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
       ((string= s "// macro")
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
        (term-send-input)
        (my-recompile))
       ((symbol-value android-mode)
        (switch-to-ansi-term)
        (insert (kbd "C-c C-c"))
        (term-send-input)
        (insert
         "cd /home/bcoste/workspace/mobileorg-android;"
         "./gradlew installDebug;"
         "adb shell monkey -p com.matburt.mobileorg2 -c android.intent.category.LAUNCHER 1;"
         )
        (term-send-input)
        (switch-to-ansi-term "logcat")
        )
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

    (defun comment-or-uncomment-region-or-line ()
      "Comments or uncomments the region or the current line if there's no active region."
      (interactive)
      (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
          (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

    	;;; describe this point lisp only
  	(defun describe-foo-at-point ()
      "Show the documentation of the Elisp function and variable near point.
  	This checks in turn:
  	-- for a function name where point is
  	-- for a variable name where point is
  	-- for a surrounding function call
  	"
  	  (interactive)
  	  (let (sym)
  	    ;; sigh, function-at-point is too clever.  we want only the first half.
  	    (cond ((setq sym (ignore-errors
                           (with-syntax-table emacs-lisp-mode-syntax-table
                             (save-excursion
                               (or (not (zerop (skip-syntax-backward "_w")))
                                   (eq (char-syntax (char-after (point))) ?w)
                                   (eq (char-syntax (char-after (point))) ?_)
                                   (forward-sexp -1))
                               (skip-chars-forward "`'")
          	                   (let ((obj (read (current-buffer))))
                                 (and (symbolp obj) (fboundp obj) obj))))))
               (describe-function sym))
              ((setq sym (variable-at-point)) (describe-variable sym))
              ;; now let it operate fully -- i.e. also check the
              ;; surrounding sexp for a function call.
              ((setq sym (function-at-point)) (describe-function sym)))))




    ;; (add-hook 'python-mode-hook
              ;; (lambda () (local-set-key (kbd "C-c C-c") 'toggle-boolean-at-point)))

    ;; activate View Mode for all read-only files
    (setq view-read-only t)

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

    (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

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
      (find-file "~/.spacemacs.d/init.el")
      )

    (defun bashrc()
      (interactive)
      (find-file "~/.bashrc")
      )


    (defun hippie-expand-or-yas-insert-snippet ()
      "If cursor is after a letter call hippie-expand else call yas-insert-snippet"
      (interactive)
      (if (or (= (point) 1)
              (string= (char-to-string (char-before (point))) " ")
              (string= (char-to-string (char-before (point))) "\n"))
          (yas-insert-snippet)
        (hippie-expand 1)))


    (custom-set-variables '(android-mode-sdk-dir "~/appz/android-sdk"))

    ;; Don't ask confirmation before closing ansi-term
    (defun set-no-process-query-on-exit ()
      (let ((proc (get-buffer-process (current-buffer))))
        (when (processp proc)
          (set-process-query-on-exit-flag proc nil))))

    (add-hook 'term-exec-hook 'set-no-process-query-on-exit)

    ;; As for C/C++, you need to specify name of the project, point to existing file at the project's root directory, and some additional options:

    ;; :srcroot
    ;; list of directories with source code. Directory names are specified relatively of project's root (in this example this is src & test);
    ;; :classpath
    ;; list of absolute file names for used libraries;
    ;; :localclasspath
    ;; list of file names for used libraries, relative to project's root.
    ;; (require 'eclim)
    ;; (global-eclim-mode)
    ;; (require 'eclimd)

    ;; (setq help-at-pt-display-when-idle t)
    ;; (setq help-at-pt-timer-delay 0.1)
    ;; (help-at-pt-set-timer)

    ;; regular auto-complete initialization
    ;; (require 'auto-complete-config)
    ;; (ac-config-default)

    ;; add the emacs-eclim source
    ;; (require 'ac-emacs-eclim-source)
    ;; (ac-emacs-eclim-config)

    ;; (global-ede-mode 1)
    ;; (require 'semantic/sb)
    ;; (semantic-mode 1)


    ;; (projectile-global-mode)

    (defun bury-compile-buffer-if-successful (buffer string)
      "Bury a compilation buffer if succeeded without warnings "
      (if (and
           (string-match "compilation" (buffer-name buffer))
           (string-match "finished" string)
           (not
            (with-current-buffer buffer
              (goto-char (point-min))
              (search-forward "warning" nil t))))
          (progn
            (android-start-app)
            (run-with-timer 1 nil
                          (lambda (buf)
                            (bury-buffer buf)
                            (delete-windows-on "*compilation*"))
                          buffer)

            )))

    (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
    )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-build-command-alist
   (quote
    ((ant . "ant -e")
     (gradle . "./gradlew")
     (maven . "mvn"))))
 '(android-mode-builder (quote gradle))
 '(android-mode-root-file-plist
   (quote
    (ant "AndroidManifest.xml" gradle "gradlew" maven "AndroidManifest.xml")))
 '(android-mode-sdk-dir "~/appz/android-sdk")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(cider-boot-parameters "dev")
 '(cider-prompt-save-file-on-load (quote always-save))
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("02553d55536ec991bfc33b67c34cfb8a8fc51d1968a0e5b805edbc7e666079f7" "093c5fc95104a716c1bdb608ea860c4eb2d37113cb5f7e6f83c76f41ed7081cd" "3a8ec1700930f086cfa102de1a353bdc4dd4db39290b0ab900c16a137ca4c42f" "07db1c8842140ec466f255feb492dd5c9c77db0b0a9c274e82de2e2b518ce3ad" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "5aa42e319623e3165cf3711f184faa6fbb7d0c90ead2d945d5f1ec42600e8e98" "9b38567fcb57a7df83c6f7641165fb0350b4d9a396404d4ff26b4e83176fb560" default)))
 '(exec-path
   (quote
    ("c:/windows/system32" "C:/windows" "C:/windows/System32/Wbem" "C:/windows/System32/WindowsPowerShell/v1.0/" "C:/windows/System32/WindowsPowerShell/v1.0/" "C:/Program Files (x86)/WebEx/Productivity Tools" "C:/Program Files (x86)/Sennheiser/SoftphoneSDK/" "C:/Program Files (x86)/Box/Box Edit/" "C:/Program Files/Git/cmd" "C:/HashiCorp/Vagrant/bin" "d:/Userfiles/bcoste/appz/emacs/libexec/emacs/24.4/i686-pc-mingw32" "d:/Userfiles/bcoste/appz/Aspell/bin" "d:/Userfiles/bcoste/appz/Putty")))
 '(gdb-many-windows t)
 '(jabber-account-list
   (quote
    (("ben.coste@gmail.com"
      (:network-server . "talk.google.com")
      (:port . 5223)
      (:connection-type . ssl)))))
 '(mail-host-address "gmail.com")
 '(org-agenda-files nil)
 '(org-babel-load-languages (quote ((python . t) (emacs-lisp . t) (plantuml . t))))
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data fsm company-statistics spinner queue adaptive-wrap yapfify xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline powerline smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file neotree multi-term move-text magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint jabber info+ indent-guide ido-vertical-mode hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help elisp-slime-nav ein request websocket easy-kill dumb-jump diminish define-word cython-mode company-quickhelp pos-tip company-anaconda company column-enforce-mode clean-aindent-mode cider pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed android-mode anaconda-mode pythonic f dash s aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build)))
 '(python-shell-extra-pythonpaths (quote ("/home/bcoste/workspace/leboncoin")))
 '(python-shell-interpreter "python")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-mail-address "ben.coste@gmail.com" t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(smtpmail-smtp-user "ben.coste@gmail.com")
 '(tramp-default-method "ssh" nil (tramp))
 '(user-full-name "Benoît Coste")
 '(user-mail-address "ben.coste@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))


;; (setq ein:use-auto-complete t)
;; (setq ein:use-auto-complete-superpack t)


;; ;; example of binding keys only when html-mode is active
;; (defun my-notebook-config ()
;;   "For use in `ein:notebook-multilang-mode-hook'."
;;   (local-set-key (kbd "C-c C-c") 'ein:worksheet-execute-cell-and-goto-next)
;;   )

;; ;; add to hook
;; (add-hook 'ein:notebook-multilang-mode-hook 'my-notebook-config)




