# Wshot

## Depends

- grim
- slurp
- zenity|qarma
- jq
- wl-clipboard

## Install


```
$ sudo cp ./wshot /usr/local/bin/
$ sudo cp ./wshot.desktop /usr/local/share/applications/
```


## Usage

Run `wayland-screenshot.desktop` from menu entry, or run `wayland-screenshot` on terminal.
Select mode, then press OK.
By default screenshots are saved to `~/tmp/screenshot_*`, edit `FILEDIR=` in `wshot` to change.

![Image of Wshot](wshot.png)

