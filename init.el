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
   dotspacemacs-ask-for-lazy-installation nil

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(vimscript
     systemd
     typescript
     ansible
     rust
     clojure
     windows-scripts
     sql
     shell-scripts
     yaml
     (javascript :variables javascript-import-tool 'import-js)
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip t)
     (c-c++
      :variables
      c-c++-default-mode-for-headers 'c++-mode
      c-c++-enable-clang-support t)
     ;; clojure
     cmake
     command-log
     csharp
     csv
     emacs-lisp
     git
     gtags
     (helm :variables helm-use-fuzzy 'source)
     html
     imenu-list
     jabber
     lsp
     markdown
     import-js
     ;; multiple-cursors
     org
     (python :variables
             python-auto-set-local-pyvenv-virtualenv 'on-project-switch
             python-sort-imports-on-save t
             python-format-on-save t
             python-formatter 'black
             python-remove-unused-imports-on-save nil
             python-test-runner '(pytest nose)
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
     (svelte :variables svelte-backend 'lsp)
     svelte
     ;; spell-checking
     syntax-checking
     treemacs
     version-control
     vue
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(vue-mode
                                      (copilot :location (recipe
                                                          :fetcher github
                                                          :repo "zerolfx/copilot.el"
                                                          :files ("*.el" "dist")))
                                      py-autopep8
                                      (py-docformatter :location (recipe :fetcher github :repo "humitos/py-docformatter.el"))
                                      pyimport
                                      python-pytest
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
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
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
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

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

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
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
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%f"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

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
  ;; (require 'sphinx-doc "~/.spacemacs.d/packages/sphinx-doc/sphinx-doc.el") ;

  (setq source-directory "/home/bcoste/appz/emacs-28.1/src")
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

  (defun python-toggle-boolean ()
    "If point is on `true' or `false', toggle it."
    (interactive)
    (unless (nth 8 (syntax-ppss)) ; inside a keyword, string or comment
      (let* ((bounds (bounds-of-thing-at-point 'symbol))
             (string (and bounds (buffer-substring-no-properties (car bounds) (cdr bounds))))
             (pt (point)))
        (when (and bounds (member string '("True" "False")))
          (delete-region (car bounds) (cdr bounds))
          (cond
           ((string= "True" string)
            (insert "False")
            (goto-char (if (= pt (cdr bounds)) (1+ pt) pt)))
           (t
            (insert "True")
            (goto-char (if (= pt (cdr bounds)) (1- pt) pt))))
          (save-buffer)
))))

  (setq mac-command-modifier 'meta)

  (menu-bar-mode 1)

  (setq bookmark-default-file "~/.spacemacs.d/bookmarks")


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

  (global-set-key [remap query-ureplace] 'anzu-query-replace)
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
  (global-set-key [f10] 'spacemacs/python-test-last)
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


  (define-key evil-normal-state-map (kbd ", t l") 'nosetests-again)


  ;; (define-key evil-normal-state-map (kbd "q") 'quit-window)
  (define-key evil-normal-state-map (kbd "'") 'helm-mini)

  (spacemacs/set-leader-keys
    "o s" 'sp-splice-sexp
    "o c" 'insert-cout
    "o [" 'swap-parens
    "o (" 'swap-parens
    "o t" 'python-pytest-dispatch
    "o f" 'create-test-function
    "o d" 'create-docstring
    "o ." 'python-toggle-boolean
    )


  (load-file "~/.spacemacs.d/hooks.el")

  ;; (let ((slack-secret "~/.spacemacs.d/slack-secret.el"))
  ;;   (when (and (require 'slack nil :noerror)
  ;;              (file-exists-p slack-secret))
  ;;     (progn (load-file slack-secret)
  ;;            (slack-start))))

  (eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))

  ;; Highlight characters that are after column 100
  (global-column-enforce-mode t)
  ;; (pyvenv-workon "env")


  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))

  (require 'copilot)
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)


  (add-hook 'prog-mode-hook 'copilot-mode)

  (define-key evil-insert-state-map (kbd "C-<tab>") 'copilot-accept-completion-by-word)
  (define-key evil-insert-state-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
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


   (defun bcoste-print-variable (arg)
     (interactive "P")
     (beginning-of-line)
     (evil-forward-word-begin)
     (let* ((content (buffer-substring (point) (line-end-position)))
            (content-no-quote (replace-regexp-in-string "\"" "" content)))

       (kill-line)

       (when (string= major-mode "python-mode")
         (insert (concat "print(f\"" content-no-quote ": {"content"}\")")))
       (when (or (string= major-mode "typescript-mode")
                 (string= major-mode "web-mode")
                 (string= major-mode "Javascript-IDE")
                 (string= major-mode "js-mode"))
         (insert (concat "console.log(\"" content-no-quote "\")"
                         "; "
                         "console.log(" content ")"
                         )))

       (when (string= major-mode "nrnhoc-mode")
         (insert (concat "printf(\"" content-no-quote ": %g\\n\", " content ")")))
       (when (string= major-mode "c++-mode")
         (insert (concat "std::cout << \"" content-no-quote ": \" << " content " << std::endl;")))
       )
     (evil-normal-state)
     (save-buffer)
     (if arg
         (nosetests-again))
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

   (defun create-test-function ()
     (interactive)
     (let* ((args (split-string (pytest-py-testable) "::"))
            (cmd (concat "/home/bcoste/.virtualenvs/cdp/bin/code-assist "
                         "add-test-function "
                         (if (> (length args) 2)
                             (string-join (list (car args) (nth 2 args) "--class-name" (nth 1 args)) " ")
                           (string-join args " ")))))
       (message (concat "cdm: " cmd))
       (shell-command cmd)
       ))

   (defun create-docstring ()
     (interactive)
     (let* ((args (split-string (pytest-py-testable) "::"))
            (cmd (concat "/home/bcoste/.virtualenvs/cdp/bin/code-assist "
                         "get-docstring "
                         (string-join args " "))))
       (message (concat "cdm: " cmd))
       (shell-command cmd)
       (let* ((data (json-read-from-string (progn
                                             (with-current-buffer "*Shell Command Output*"
                                               (buffer-string)))))
              (docstring (cdr (assoc `docstring data)))
              (range (cdr (assoc `range data)))
              )
         (goto-line (+ 1 (aref range 0)))
         (when (aref range 1)
             (kill-whole-line (- (aref range 1) (aref range 0))))
         (insert docstring)
         )
       ))

   (defun next-function-to-top ()
     (interactive)
     (end-of-defun 2)
     (beginning-of-defun)
     (recenter 0)
     )

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
 '(backup-directory-alist `(("." . "~/.emacs.d/saves")))
 '(c-electric-flag nil t)
 '(cider-prompt-save-file-on-load 'always-save t)
 '(cider-save-file-on-load 'always-save)
 '(column-enforce-column 100)
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-read-command t)
 '(compilation-scroll-output 'first-error)
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" default))
 '(delete-old-versions t)
 '(dired-listing-switches "-lah")
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol nil)
 '(explicit-shell-file-name "/usr/bin/fish")
 '(flycheck-disabled-checkers '(python-flake8))
 '(gdb-many-windows t t)
 '(git-commit-major-mode 'markdown-mode)
 '(grep-find-ignored-directories
   '(".svelte-kit" "site-packages" "SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" "dist" ".next"))
 '(grep-find-ignored-files
   '("*.zip" "unittests" "nodeids" "*.whl" "*.so" ".#*" "*.hi" "*.o" "*~" "*.bin" "*.lbin" "*.so.*" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.parquet" "*.sqlite3" "GRTAGS" "GTAGS" "tags" "TAGS" "GPATH"))
 '(helm-boring-file-regexp-list
   '("\\.egg-info$" "\\.hi$" "\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn/\\|\\.svn$" "\\.hg/\\|\\.hg$" "\\.git/\\|\\.git$" "\\.bzr/\\|\\.bzr$" "CVS/\\|CVS$" "_darcs/\\|_darcs$" "_MTN/\\|_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "\\.feather$"))
 '(helm-buffers-truncate-lines nil)
 '(helm-ff-skip-boring-files t)
 '(helm-grep-ignored-directories
   '(".svelte-kit/" "build/" "SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "site-packages/" ".tox/" ".mypy_cache/"))
 '(helm-grep-ignored-files
   '("package-lock.json" "unittests" "nodeids" ".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.parquet"))
 '(helm-window-prefer-horizontal-split t)
 '(hippie-expand-try-functions-list
   '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))
 '(importmagic-style-configuration-alist '((multiline . parentheses) (max_columns . 100)))
 '(jiralib-url "https://bbpteam.epfl.ch/project/issues/")
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(lsp-ui-doc-include-signature t)
 '(mail-host-address "gmail.com")
 '(nose-use-verbose nil t)
 '(org-agenda-files
   '("second.org" "jazz.org" "poleEmploi.org" "google.org" "muscu.org" "rando.org" "test.org"))
 '(org-babel-load-languages '((python . t) (emacs-lisp . t) (plantuml . t)))
 '(org-confirm-babel-evaluate nil)
 '(org-directory "~/notes" t)
 '(org-jira-working-dir "~/org-jira/")
 '(org-mobile-agenda 'default)
 '(org-mobile-directory "~/Dropbox/mobileOrg-benoit")
 '(package-selected-packages
   '(dactyl-mode vimrc-mode journalctl-mode omnisharp csharp-mode copilot lsp-docker ccls helm-lsp lsp-origami origami lsp-pyright lsp-python-ms lsp-ui vim-powerline tern string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin space-doc pylookup multi-vterm xref help-fns+ code-cells holy-mode evil-evilified-state typescript-mode import-js grizzl add-node-modules-path ron-mode rust-mode dap-mode lsp-treemacs bui lsp-mode cfrs posframe jinja2-mode company-ansible ansible-doc ansible python-pytest anaconda-mode counsel swiper ivy sqlup-mode sql-indent insert-shebang helm-gtags ggtags flycheck-bashate fish-mode counsel-gtags company-shell stickyfunc-enhance srefactor yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify vue-mode volatile-highlights vi-tilde-fringe uuidgen use-package twittering-mode toml-mode toc-org tagedit symon string-inflection spaceline-all-the-icons smeargle slim-mode slack shell-pop scss-mode sayid sass-mode restclient-helm restart-emacs rainbow-delimiters racer pyvenv pytest py-isort py-autopep8 pug-mode powershell popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-restclient ob-http nix-mode neotree nameless multi-term move-text markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint kotlin-mode json-navigator json-mode js2-refactor js-doc jabber intero indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-nixos-options helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-ctest helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate google-c-style golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks engine-mode emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig easy-kill dumb-jump disaster diminish define-word dante cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-rtags company-restclient company-quickhelp company-nixos-options company-ghci company-ghc company-emoji company-cabal company-c-headers company-anaconda command-log-mode column-enforce-mode cmm-mode cmake-mode cmake-ide clojure-snippets clojure-cheatsheet clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu centered-cursor-mode cargo auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))
 '(popwin:special-display-config
   '(("^\\*Flycheck.+\\*$" :regexp t :position bottom :noselect t :dedicated t :stick t)
     ("*cider-doc*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("*cider-error*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("^*WoMan.+*$" :regexp t :position bottom)
     ("*grep*" :position bottom :noselect nil :dedicated t :stick t)
     ("*xref*" :width 0.5 :position right :noselect nil :dedicated nil :stick nil)
     ("*ert*" :position bottom :noselect nil :dedicated t :stick t)
     (" *undo-tree*" :height 0.4 :position bottom :noselect nil :dedicated t :stick t)
     ("*Async Shell Command*" :position bottom :noselect nil :dedicated t :stick t)
     ("*Shell Command Output*" :position bottom :noselect nil :dedicated t :stick t)
     (magit-status-mode :width 0.5 :position right :noselect nil :dedicated t :stick t)
     ("*compilation*" :width 0.5 :position right :noselect nil :dedicated nil :stick t)
     ("*nosetests*" :width 0.5 :position right :noselect t :dedicated nil :stick nil)
     ("^*pytest-.+*$" :regexp t :width 0.5 :position right :noselect t :dedicated nil :stick nil)
     ("*Help*" :height 0.4 :position bottom :noselect t :dedicated t :stick nil)))
 '(projectile-globally-ignored-directories
   '("build" ".tox" "platform_venv" ".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".stack-work" "site-packages" "staticfiles"))
 '(py-autopep8-options '("--max-line-length=100"))
 '(py-isort-options '("-l 100"))
 '(pytest-cmd-flags "-x -s -vv")
 '(safe-local-variable-values
   '((eval eval-after-load "grep"
           '(dolist
                (item
                 '("*.feather" "*.xlsx"))
              (add-to-list
               (make-local-variable 'grep-find-ignored-files)
               item)))
     (eval eval-after-load "grep"
           '(add-to-list
             (make-local-variable 'grep-find-ignored-files)
             "*.feather" "*.xlsx"))
     (eval eval-after-load "grep"
           '(add-to-list
             (make-local-variable 'grep-find-ignored-files)
             "*.feather"))
     (eval eval-after-load "grep"
           '(add-to-list
             (make-local-variable 'grep-find-ignored-files)
             "*.feather *.xlsx"))
     (projectile-project-ignored-directories quote
                                             ("data/"))
     (projectile-project-ignored-directories quote
                                             ("data"))
     (helm-make-build-dir . "build/")
     (projectile-project-test-cmd . "make test")))
 '(send-mail-function 'smtpmail-send-it)
 '(set-mark-command-repeat-pop t)
 '(slack-buffer-create-on-notify t)
 '(smtpmail-mail-address "ben.coste@gmail.com" t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(smtpmail-smtp-user "ben.coste@gmail.com")
 '(spacemacs-large-file-modes-list
   '(tags-table-mode archive-mode tar-mode jka-compr git-commit-mode image-mode doc-view-mode doc-view-mode-maybe ebrowse-tree-mode pdf-view-mode))
 '(sphinx-doc-docstring-style "google")
 '(sphinx-doc-include-types nil)
 '(split-height-threshold 0)
 '(split-width-threshold nil)
 '(tags-add-tables nil)
 '(term-buffer-maximum-size 50000)
 '(tramp-default-method "ssh")
 '(user-full-name "Benoit Coste")
 '(user-mail-address "ben.coste@gmail.com")
 '(version-control t)
 '(warning-suppress-log-types '((emacs)))
 '(warning-suppress-types '(((python python-shell-prompt-regexp)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
