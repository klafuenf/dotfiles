if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    broot --print-shell-function fish | source
end

# Initialisieren von direnv
eval (direnv hook fish)

