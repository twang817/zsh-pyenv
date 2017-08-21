local PYENV_ROOT=$HOME/.pyenv
local fresh_install=0

[ -d $PYENV_ROOT ] || {
    git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT
    fresh_install=1
} > /dev/null

export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

[ $fresh_install -eq 1 ] && {
    local all=$(pyenv install -l | tr -d '^ \t')
    local py27=$(echo $all | \grep -P "^2\.7\.\d+$" | tail -1)
    local py3=$(echo $all | \grep -P "^3\.\d+\.\d+$" | tail -1)
    echo "Installing $py27 for pyenv..."
    pyenv install -s $py27
    echo "Installing $py3 for pyenv..."
    pyenv install -s $py3
    pyenv global $py27 $py3
    pyenv versions
}
