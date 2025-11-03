# dotfilles

# Add to .\*rc file

```
export PATH="$HOME/bin:$PATH"
```

## For myconf/rc

bash

```
if [ -d "$HOME/.config/myconf/rc"
  for f in "$HOME/.config/myconf/rc"/*; do
    [ -f "$f" ] && . "$f"
  done
fi
```

zsh

```
if [[ -d "$HOME/.config/myconf/rc" ]]; then
  for f in $HOME/.config/myconf/rc/*(.N); do
    source "$f"
  done
fi
```
