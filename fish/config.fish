if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    broot --print-shell-function fish | source
end

#if test -n "$DESKTOP_SESSION"
#    set -x (gnome-keyring-daemon --start | string split "=")
#end

#export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
