PYENV=$(which pyenv) || PYENV=

if [[ -z "$PYENV" ]]; then
    export PYENV_ROOT=$HOME/.pyenv
    if [[ ! -d "$PYENV_ROOT" ]]; then
      git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT
    fi
    export PATH=$PYENV_ROOT/bin:$PATH
fi
  
eval "$(pyenv init -)"
