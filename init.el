;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip t)
     ;; better-defaults
     c-c++
     clojure
     csv
     emacs-lisp
     git
     haskell
     helm
     html
     jabber
     markdown
     org
     python
     rust
     semantic
     twitter
     shell
     slack
     spell-checking
     spotify
     syntax-checking
     version-control
     ;; vim-powerline
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(kotlin-mode
                                      py-autopep8
                                      easy-kill)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default nil)
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (bookmarks . 10))
   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
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
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-config ()
  (require 'iso-transl)
  (require 'helm-bookmark)
  (require 'py-autopep8)
  (require 'term)
  (require 'company)

  (define-key xref--xref-buffer-mode-map (kbd "q") 'evil-quit)
  (define-key company-active-map (kbd "C-f") 'nil)

  (define-key compilation-mode-map (kbd "?") 'evil-search-backward)
  (define-key compilation-mode-map (kbd "h") 'evil-backward-char)

  (define-key term-raw-map [remap execute-extended-command] 'helm-M-x)
  (define-key term-raw-map (kbd "M-v") 'scroll-down)
  (define-key term-raw-map (kbd "C-v") 'scroll-up)
  (define-key term-raw-map [?\M-o] 'other-window)
  (define-key term-mode-map (kbd "C-m") 'char-mode-and-enter)

  (setq c-default-style "linux" c-basic-offset 4)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)

  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key (kbd "M-.") 'up-list) ;; Go out of the block of (),{} ... by the top
  (global-set-key (kbd "M-,") 'backward-up-list) ;; Go out of the block of (),{} ... by the bottom
  (global-set-key [f1] 'recompile)
  (global-set-key [f2] 'switch-to-ansi-term)
  (global-set-key [f6] 'android-gradle-installDebug)
  (global-set-key [f7] 'anzu-replace-at-cursor-thing)
  (global-set-key [f8] 'replace-string)
  (global-set-key [f10] 'find-regex-in-all-buffers)
  (global-set-key [f12] 'my_cout)
  (global-set-key [C-/] 'undo)
  (global-set-key (kbd "M-o") 'other-window)
  ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
  ;; (global-set-key (kbd "C-x f")   'ido-find-file)
  ;; (global-set-key (kbd "C-x b") 'ido-switch-buffer)
  (global-set-key (kbd "C-x b")   'helm-mini)
  (global-set-key (kbd "C-x C-b")   'helm-mini)
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

  (spacemacs/set-leader-keys
    "o [" 'swap-parens
    "o (" 'swap-parens)

  ;; To recognize hoplon files correctly add this to your .emacs
  (add-to-list 'auto-mode-alist '("\\.cljs\\.hl\\'" . clojurescript-mode))

  (load-file "~/.spacemacs.d/hooks.el")

  (let ((slack-secret-file "~/.spacemacs.d/slack-secret.el"))
    (when (file-exists-p slack-secret-file)
      (progn (load-file slack-secret-file)
             (slack-start))))

  (eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))



  (setq neurolucida-mode-hook nil)
  (define-derived-mode neurolucida-mode clojure-mode "NEUROLUCIDA"
    "major mode for editing mymath language code.")
  (add-to-list 'auto-mode-alist '("\\.asc\\'" . neurolucida-mode))

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


  (load-file "~/.spacemacs.d/setup-linux-config.el")
  (load-file "~/.spacemacs.d/python-imports.el")
  (load-file "~/.spacemacs.d/change-brackets.el")

  ;;Nom de la fonction dans la barre
  ;; (which-function-mode 1)



  ;;Incrementer des nombres
  (defun increment-number-at-point ()
    (interactive)
    (skip-chars-backward "0123456789")
    (or (looking-at "[0123456789]+")
        (error "No number at point"))
    (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))


  (setq-default ispell-program-name "aspell")

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



  (defun convert-html-to-hlisp (html-str)
    "Take a HTML string and returns the corresponding HLisp string"
    (interactive "sHTML string ? ")
    (insert (replace-regexp-in-string "<\\(\\w+\\) " "(\\1 " (replace-regexp-in-string " \\(\\w+\\)=" " :\\1 " (replace-regexp-in-string "</\\w+>" ")"   html-str)))))



  ;; Better helm result sorting
  ;; https://github.com/emacs-helm/helm/issues/1492
  (defun helm-buffers-sort-transformer@donot-sort (_ candidates _)
    candidates)
  (advice-add 'helm-buffers-sort-transformer :around 'helm-buffers-sort-transformer@donot-sort)
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alert-fade-time 60)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(backup-by-copying t)
 '(backup-directory-alist (\` (("." . "~/.emacs.d/saves"))))
 '(bookmark-default-file "/home/bcoste/.spacemacs.d/bookmarks")
 '(cider-boot-parameters "cider repl -s wait")
 '(cider-prompt-save-file-on-load (quote always-save))
 '(cider-save-file-on-load (quote always-save))
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-read-command t)
 '(compilation-scroll-output (quote first-error))
 '(delete-old-versions t)
 '(dired-listing-switches "-lah")
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol nil)
 '(gdb-many-windows t t)
 '(helm-ff-skip-boring-files t)
 '(hippie-expand-try-functions-list
   (quote
    (try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(mail-host-address "gmail.com")
 '(org-agenda-files
   (quote
    ("second.org" "jazz.org" "poleEmploi.org" "google.org" "muscu.org" "rando.org" "test.org")))
 '(org-babel-load-languages (quote ((python . t) (emacs-lisp . t) (plantuml . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-directory "~/notes")
 '(org-mobile-agenda (quote default))
 '(org-mobile-directory "~/Dropbox/mobileOrg-benoit")
 '(package-selected-packages
   (quote
    (ggtags add-node-modules-path stickyfunc-enhance srefactor git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl browse-at-remote kotlin-mode helm-purpose org-brain evil-org zenburn-theme window-purpose imenu-list symon string-inflection solarized-theme sayid realgud test-simple loc-changes load-relative password-generator monokai-theme impatient-mode flyspell-correct-popup evil-unimpaired evil-lion emoji-cheat-sheet-plus editorconfig dante company-emoji cmake-ide levenshtein twittering-mode disaster company-c-headers cmake-mode clang-format spotify helm-spotify multi slack emojify circe oauth2 ht yaml-mode web-beautify org-category-capture mmm-mode markdown-toc markdown-mode livid-mode json-mode json-snatcher json-reformat js2-refactor js-doc gh-md skewer-mode request-deferred deferred js2-mode simple-httpd company-tern dash-functional tern coffee-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu winum toml-mode racer py-autopep8 intero hlint-refactor hindent helm-hoogle haskell-snippets fuzzy flycheck-rust flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode seq cargo rust-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data fsm company-statistics spinner queue adaptive-wrap yapfify xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline powerline smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file neotree multi-term move-text magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint jabber info+ indent-guide ido-vertical-mode hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help elisp-slime-nav ein request websocket easy-kill dumb-jump diminish define-word cython-mode company-quickhelp pos-tip company-anaconda company column-enforce-mode clean-aindent-mode cider pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed android-mode anaconda-mode pythonic f dash s aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build)))
 '(popwin:special-display-config
   (quote
    (("^\\*Flycheck.+\\*$" :regexp t :position bottom :noselect t :dedicated t :stick t)
     ("*cider-doc*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("*cider-error*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("^*WoMan.+*$" :regexp t :position bottom)
     ("*grep*" :position bottom :noselect nil :dedicated t :stick t)
     ("*xref*" :position right :noselect nil :dedicated t :stick t)
     ("*ert*" :position bottom :noselect nil :dedicated t :stick t)
     (" *undo-tree*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("*Async Shell Command*" :position bottom :noselect nil :dedicated t :stick t)
     ("*Shell Command Output*" :position bottom :noselect nil :dedicated t :stick t)
     ;; ("*nosetests*" :width 0.5 :position right :noselect t :dedicated nil :stick t)
     ;; ("*Python*" :width 0.5 :position right :noselect t :dedicated nil :stick nil :tail t)
     ("*Help*" :height 0.4 :position bottom :noselect t :dedicated t :stick nil))))
 '(py-autopep8-options (quote ("--max-line-length=100")))
 '(send-mail-function (quote smtpmail-send-it))
 '(set-mark-command-repeat-pop t)
 '(nose-use-verbose t)
 '(slack-buffer-create-on-notify t)
 '(smtpmail-mail-address "ben.coste@gmail.com" t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(smtpmail-smtp-user "ben.coste@gmail.com")
 '(term-buffer-maximum-size 50000)
 '(tramp-default-method "ssh")
 '(user-full-name "Benoit Coste")
 '(user-mail-address "ben.coste@gmail.com")
 '(version-control t)
 '(view-read-only t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
