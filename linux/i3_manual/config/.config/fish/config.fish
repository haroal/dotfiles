# For Python virtualenv wrapper
set -g -x VIRTUALFISH_HOME $HOME/.virtualenv
eval (python -m virtualfish compat_aliases)

# Add flatbuffers to PATH
set -g -x PATH $HOME/flatbuffers $PATH
