if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init --cmd cd fish | source
    direnv hook fish | source
    set -gx EDITOR $(which nvim)
end
