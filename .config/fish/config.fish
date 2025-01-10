# source ~/.config/fish/themes/kanagawa-dragon.fish
# Disable greeting
set -g fish_greeting

# Directories
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path
abbr mkdir 'mkdir -p'

# Paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -xg PYTHONPATH $HOME/workspace/predigle/pluto/api-pluto-pmi

set --export PATH \
    $HOME/.pyenv/shims \
    $HOME/.pyenv/bin \
    $HOME/.bun/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $HOME/.nvm/versions/node/*/bin \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /usr/local/go/bin \
    /usr/local/bin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin

set --export XDG_CONFIG_HOME \
    $HOME/.config

# Init in background
function init_background --on-event fish_prompt
    starship init fish | source &
    pyenv init --path | source &
end
