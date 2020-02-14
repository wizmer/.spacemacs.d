;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
   '(shell-scripts
     yaml
     javascript
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
     (c-c++
      :variables
      c-c++-default-mode-for-headers 'c++-mode
      c-c++-enable-clang-support t)
     ;; clojure
     cmake
     command-log
     csv
     emacs-lisp
     git
     github
     (helm :variables helm-use-fuzzy 'source)
     html
     imenu-list
     jabber
     markdown
     nixos
     org
     (python :variables
             python-auto-set-local-pyvenv-virtualenv 'on-project-switch
             ;; python-sort-imports-on-save t
             ;; python-remove-unused-imports-on-save nil
             )
     ;; rust
     search-engine
     semantic
     ;; shell-script
     spacemacs-purpose
     ;; super-save
     twitter
     shell
     slack
     ;; spell-checking
     syntax-checking
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(vue-mode
                                      sphinx-doc
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
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

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

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

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
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal)

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

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
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

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
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
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

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
   dotspacemacs-frame-title-format "%f"

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
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-config ()
  (require 'iso-transl)
  (require 'helm-bookmark)
  (require 'py-autopep8)
  (require 'term)
  (require 'company)

  (defun normal-state-and-recompile ()
    (interactive)
    (evil-normal-state)
    (recompile))

  (defmacro apply-and-evil-normal-state (functionname)
    "Create a function that calls the passed function and go back to evil normal state"
    (let ((funsymbol (intern (concat (symbol-name functionname) "-and-evil-normal-state"))))
      `(defun ,funsymbol (arg)
         (interactive "P")
         (evil-normal-state)
         (,functionname arg))

      `(global-set-key [remap ,functionname] ',funsymbol)
      ))

  ;; (apply-and-evil-normal-state spacemacs/python-test-one)
  ;; (apply-and-evil-normal-state spacemacs/python-test-module)
  ;; (apply-and-evil-normal-state spacemacs/python-test-all)

  (defun disable-all-minor-modes ()
    (interactive)
    (mapc
     (lambda (mode-symbol)
       (when (functionp mode-symbol)
         ;; some symbols are functions which aren't normal mode functions
         (ignore-errors
           (funcall mode-symbol -1))))
     minor-mode-list))

  (defun compile-current-buffer ()
      (interactive)
    (compile (buffer-file-name)))

  (defun insert-cout (message)
    (interactive "sMessage to cout ? ")
    (c-indent-line-or-region)
    (insert "std::cout << \"")
    (insert message)
    (insert "\" << std::endl;")
    (newline-and-indent))

  (setq mac-command-modifier 'meta)

  (menu-bar-mode 1)

  (defun nosetests-nose-command()
    "PYTHONPATH=${PYTHONPATH}:/home/bcoste/workspace/morphology/io/build/binds/python LD_PRELOAD=\"/home/bcoste/workspace/morphology/io/build/brion/libbrion.so /home/bcoste/workspace/morphology/io/build/brain/libbrain.so\" /usr/bin/env python $(which nosetests)"
    ;; "PYTHONPATH=${PYTHONPATH}:/home/bcoste/workspace/morphology/io/build/binds/python LD_PRELOAD='/home/bcoste/workspace/morphology/io/build/brion/libbrion.so /home/bcoste/workspace/morphology/io/build/brain/libbrain.so' python -u -c \"import nose; nose.run()\""
    )
  (setq bookmark-default-file "/home/bcoste/.spacemacs.d/bookmarks")


  (define-key company-active-map (kbd "C-f") 'nil)

  ;; (define-key compilation-mode-map (kbd "?") 'evil-search-backward)
  ;; (define-key compilation-mode-map (kbd "h") 'evil-backward-char)

  ;; (helm :sources 'evil-search-forward-history
  ;;       ;; :input (if (string-match-p "\\`~" fname)
  ;;       ;;            (expand-file-name fname) fname)
  ;;       ;; :case-fold-search helm-file-name-case-fold-search
  ;;       ;; :preselect preselect
  ;;       ;; :ff-transformer-show-only-basename
  ;;       ;; helm-ff-transformer-show-only-basename
  ;;       :prompt "Cycle history: "
  ;;       :buffer "*helm isearch history*")

  (define-key term-raw-map [remap execute-extended-command] 'helm-M-x)
  (define-key term-raw-map (kbd "M-v") 'scroll-down)
  (define-key term-raw-map (kbd "C-v") 'scroll-up)
  (define-key term-raw-map [?\M-o] 'other-window)
  (define-key term-mode-map (kbd "C-m") 'char-mode-and-enter)
  ;; (define-key sh-mode-map (kbd "C-c C-c") 'compile-current-buffer)

  (setq c-default-style "linux"
        c-basic-offset 4)
  (c-set-offset 'innamespace 0)

  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)

  (global-set-key (kbd "C-c d") 'kill-line-relative)
  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key (kbd "M-.") 'up-list) ;; Go out of the block of (),{} ... by the top
  (global-set-key (kbd "M-,") 'backward-up-list) ;; Go out of the block of (),{} ... by the bottom
  (global-set-key [f1] 'normal-state-and-recompile)
  (global-set-key [f2] 'switch-to-ansi-term)
  (global-set-key [f6] 'android-gradle-installDebug)
  (global-set-key [f7] 'anzu-replace-at-cursor-thing)
  (global-set-key [f8] 'replace-string)
  (global-set-key [f9] 'bcoste-print-variable)
  (global-set-key [f10] 'find-regex-in-all-buffers)
  (global-set-key [f12] 'my_cout)
  (global-set-key [C-/] 'undo)
  (global-set-key (kbd "M-o") 'other-window)
  (global-set-key (kbd "C-x b")   'helm-mini)
  (global-set-key (kbd "C-x C-b")   'helm-mini)
  (global-set-key (kbd "M-y")   'helm-show-kill-ring)
  (global-set-key (kbd "M-i")   'imenu)
  (global-set-key (kbd "C-x j") 'ansi-term)
  (global-set-key (kbd "C-c w") 'copy-quoted-text-at-point)
  (global-set-key (kbd "C-c m") 'overwrite-mode)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-a") 'back-to-indentation-or-beginning-of-line)
  (global-set-key (kbd "C-x <f2>") 'switch-to-ansi-term-and-goto-current-directory)
  (global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
  (global-set-key (kbd "C-c /") 'describe-foo-at-point)

  (global-set-key (kbd "") 'describe-foo-at-point)

  (define-key evil-normal-state-map (kbd ", t l") 'nosetests-again)


  ;; (define-key evil-normal-state-map (kbd "q") 'quit-window)
  (define-key evil-normal-state-map (kbd "'") 'helm-mini)

  (spacemacs/set-leader-keys
    "o s" 'sp-splice-sexp
    "o c" 'insert-cout
    "o [" 'swap-parens
    "o (" 'swap-parens)


  ;; To recognize hoplon files correctly add this to your .emacs
  (add-to-list 'auto-mode-alist '("\\.cljs\\.hl\\'" . clojurescript-mode))

  (load-file "~/.spacemacs.d/hooks.el")

  ;; (let ((slack-secret "~/.spacemacs.d/slack-secret.el"))
  ;;   (when (and (require 'slack nil :noerror)
  ;;              (file-exists-p slack-secret))
  ;;     (progn (load-file slack-secret)
  ;;            (slack-start))))

  (when (string-prefix-p "bluebrain" (system-name))
    (load-file "~/.spacemacs.d/bbp.el"))


  (eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))

  (global-column-enforce-mode t)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
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

  (add-to-list 'auto-mode-alist '("\\.ipp\\'" . c++-mode))
  ;;Nom de la fonction dans la barre
  ;; (which-function-mode 1)

  (defun back-to-indentation-or-beginning-of-line ()
    "Go to the first non-blank char of the line if not already on it
Else, go to the beggining of line"
    (interactive)
    (let ((current-point (point)))
      (back-to-indentation)
      (when (= (point) current-point)
        (beginning-of-line))))

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

  (defun pwd (arg)
    "Put the current file name on the clipboard
     if ARG is not nil, put the parent folder "
    (interactive "P")
    (let ((filename (if (or arg (equal major-mode 'dired-mode))
                        default-directory
                      (buffer-file-name))))
      (when filename
        (with-temp-buffer
          (insert filename)
          (clipboard-kill-region (point-min) (point-max)))
        (message filename))))


  (defun bcoste-print-variable ()
    (interactive)
    (beginning-of-line)
    (evil-forward-word-begin)
    (let* ((content (buffer-substring (point) (line-end-position)))
           (content-no-quote (replace-regexp-in-string "\"" "" content)))

      (kill-line)

      (when (string= major-mode "python-mode")
        (insert (concat "print(\"" content-no-quote ": {}\".format(" content "))")))

      (when (string= major-mode "nrnhoc-mode")
        (insert (concat "printf(\"" content-no-quote ": %g\\n\", " content ")")))
      (when (string= major-mode "c++-mode")
        (insert (concat "std::cout << \"" content-no-quote ": \" << " content " << std::endl;")))
      )
    )

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

  (defun to-c++ ()
    "Reformat python code to c++ code"
    (interactive)
    (replace-string "[" "{")
    (beginning-of-buffer)
    (replace-string "]" "}")
    (beginning-of-buffer)
    (replace-regexp ")\n" ");\n")
    (beginning-of-buffer)
    (replace-regexp "}\n" "};\n")
    (beginning-of-buffer)
    (replace-string "points =" "points() =")
    (beginning-of-buffer)
    (replace-string "diameters =" "diameters() =")
    )

  (defun copy-quoted-text-at-point ()
    (interactive)
    (let ((delim '("\'" "\"" "\`"))
          (start 0)
          (theDelim "")
          (p0 (point)))
      (dolist (elt delim)
        (setq starttmp (search-backward elt nil t) )
        (goto-char p0)
        (if (numberp starttmp)
            (if (< start starttmp)
                (progn
                  (setq thedelim elt)
                  (setq start (+ starttmp 1))))))
      (forward-char)
      (setq end (- (search-forward thedelim) 1))
      (kill-ring-save start end)))

  (defun kill-line-relative (&optional arg)
    "kill relative line."
    (interactive "ndelete line # (relative) ? ")
    (save-excursion
      (forward-visible-line arg)
      (kill-whole-line)))


  (defun find-regex-in-all-buffers (regexp)
    (interactive "ssearch for regexp ? ")
    (multi-occur-in-matching-buffers ".*" regexp))

  (defun comment-or-uncomment-region-or-line ()
    "comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
      (if (region-active-p)
          (setq beg (region-beginning) end (region-end))
        (setq beg (line-beginning-position) end (line-end-position)))
      (comment-or-uncomment-region beg end)))



  (defun convert-html-to-hlisp (html-str)
    "take a html string and returns the corresponding hlisp string"
    (interactive "shtml string ? ")
    (insert (replace-regexp-in-string "<\\(\\w+\\) " "(\\1 " (replace-regexp-in-string " \\(\\w+\\)=" " :\\1 " (replace-regexp-in-string "</\\w+>" ")"   html-str)))))




  ;; better helm result sorting
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
 '(c-electric-flag nil t)
 '(cider-boot-parameters "cider repl -s wait")
 '(cider-prompt-save-file-on-load (quote always-save) t)
 '(cider-save-file-on-load (quote always-save))
 '(column-enforce-column 100)
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-read-command t)
 '(compilation-scroll-output (quote first-error))
 '(delete-old-versions t)
 '(dired-listing-switches "-lah")
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol nil)
 '(gdb-many-windows t t)
 '(grep-find-ignored-files
   (quote
    ("*.whl" "*.so" ".#*" "*.hi" "*.o" "*~" "*.bin" "*.lbin" "*.so.*" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo")))
 '(helm-boring-file-regexp-list
   (quote
    ("\\.egg-info$" "\\.hi$" "\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn/\\|\\.svn$" "\\.hg/\\|\\.hg$" "\\.git/\\|\\.git$" "\\.bzr/\\|\\.bzr$" "CVS/\\|CVS$" "_darcs/\\|_darcs$" "_MTN/\\|_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "\\.feather$")))
 '(helm-buffers-truncate-lines nil)
 '(helm-ff-skip-boring-files t)
 '(helm-grep-ignored-directories
   (quote
    ("build/" "SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "site-packages/" ".tox")))
 '(helm-window-prefer-horizontal-split t)
 '(hippie-expand-try-functions-list
   (quote
    (try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(jiralib-url "https://bbpteam.epfl.ch/project/issues/")
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(mail-host-address "gmail.com")
 '(nose-use-verbose nil t)
 '(org-agenda-files
   (quote
    ("second.org" "jazz.org" "poleEmploi.org" "google.org" "muscu.org" "rando.org" "test.org")))
 '(org-babel-load-languages (quote ((python . t) (emacs-lisp . t) (plantuml . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-directory "~/notes" t)
 '(org-jira-working-dir "~/org-jira/")
 '(org-mobile-agenda (quote default))
 '(org-mobile-directory "~/Dropbox/mobileOrg-benoit")
 '(package-selected-packages
   (quote
    (insert-shebang helm-gtags ggtags flycheck-bashate fish-mode counsel-gtags company-shell stickyfunc-enhance srefactor yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify vue-mode volatile-highlights vi-tilde-fringe uuidgen use-package twittering-mode toml-mode toc-org tagedit symon string-inflection sphinx-doc spaceline-all-the-icons smeargle slim-mode slack shell-pop scss-mode sayid sass-mode restclient-helm restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort py-autopep8 pug-mode powershell popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-restclient ob-http nix-mode neotree nameless multi-term move-text markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint kotlin-mode json-navigator json-mode js2-refactor js-doc jabber intero indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-nixos-options helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-ctest helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate google-c-style golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks engine-mode emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig easy-kill dumb-jump disaster diminish define-word dante cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-rtags company-restclient company-quickhelp company-nixos-options company-ghci company-ghc company-emoji company-cabal company-c-headers company-anaconda command-log-mode column-enforce-mode cmm-mode cmake-mode cmake-ide clojure-snippets clojure-cheatsheet clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu centered-cursor-mode cargo auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(popwin:special-display-config
   (quote
    (("^\\*Flycheck.+\\*$" :regexp t :position bottom :noselect t :dedicated t :stick t)
     ("*cider-doc*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("*cider-error*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("^*WoMan.+*$" :regexp t :position bottom)
     ("*grep*" :position bottom :noselect nil :dedicated t :stick t)
     ("*xref*" :position right :width 0.5 :noselect nil :dedicated nil :stick nil)
     ("*ert*" :position bottom :noselect nil :dedicated t :stick t)
     (" *undo-tree*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("*Async Shell Command*" :position bottom :noselect nil :dedicated t :stick t)
     ("*Shell Command Output*" :position bottom :noselect nil :dedicated t :stick t)
     (magit-status-mode :position right :width 0.5 :noselect nil :dedicated t :stick t)
     ("*compilation*" :position right :width 0.5 :noselect nil :dedicated nil :stick t)
     ("*nosetests*" :position right :width 0.5 :noselect t :dedicated nil :stick nil)
     ("*Help*" :height 0.4 :position bottom :noselect t :dedicated t :stick nil))))
 '(projectile-globally-ignored-directories
   (quote
    ("build" ".tox" "platform_venv" ".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".stack-work" "site-packages")))
 '(py-autopep8-options (quote ("--max-line-length=100")))
 '(pyvenv-virtualenvwrapper-python "/usr/bin/python")
 '(safe-local-variable-values
   (quote
    ((helm-make-build-dir . "build/")
     (projectile-project-test-cmd . "make test"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(set-mark-command-repeat-pop t)
 '(slack-buffer-create-on-notify t)
 '(smtpmail-mail-address "ben.coste@gmail.com" t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(smtpmail-smtp-user "ben.coste@gmail.com")
 '(spacemacs-large-file-modes-list
   (quote
    (tags-table-mode archive-mode tar-mode jka-compr git-commit-mode image-mode doc-view-mode doc-view-mode-maybe ebrowse-tree-mode pdf-view-mode)))
 '(split-height-threshold 0)
 '(split-width-threshold nil)
 '(tags-add-tables nil)
 '(term-buffer-maximum-size 50000)
 '(tramp-default-method "ssh")
 '(user-full-name "Benoit Coste")
 '(user-mail-address "ben.coste@gmail.com")
 '(version-control t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
