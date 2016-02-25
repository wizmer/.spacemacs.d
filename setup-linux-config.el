(defun setup-linux-config ()
  (interactive)
  
  (setq file-list '(
                    
                    ("~/.bash_aliases" . " 
alias ip='ipython'
alias e='emacs -nw --no-desktop'
alias em='emacs -nw'
alias o='xdg-open'
alias f='find . -name'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
"
                     )

                    ("~/.gitconfig" . "

\[user\]
name = wizmer
email = ben.coste@gmail.com
\[alias\]
co = checkout
br = branch
ci = commit
st = status
last = log -1 HEAD
exists = ls-files --error-unmatch
\[push\]
default = simple"
                     )

                    )
        )

  (dolist (el file-list)
    (if  (file-exists-p (car el))
        (if (y-or-n-p (concat "overwrite " (car el) " ? (default yes) "))
            (write-region (cdr el) nil (car el)))
      (write-region (cdr el) nil (car el)))
    )
  )





