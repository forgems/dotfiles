thinkpad T14/Fedora
Execute this to fix touchpad two finger scrolling issue:
```
sudo grubby --args="i8042.nomux=1" --update-kernel=ALL
```
