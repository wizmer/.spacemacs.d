(defun bash_aliases()
  (interactive)
  (let ((aliases
        "alias ip='ipython'
alias e='emacs -nw --no-desktop'
alias em='emacs -nw'
alias o='xdg-open'
alias f='find . -name'"))
  (write-region aliases nil "~/.bash_aliases" 'append)))
   
