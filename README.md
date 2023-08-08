# Wshot

Simple screenshot GUI for wayland.

![Image of Wshot](wshot1.png)

## Depends

- grim
- slurp
- zenity|qarma
- jq
- wl-clipboard

## Install

```
git clone https://github.com/stefonarch/Wshot.git
cd Wshot
sudo cp ./wshot /usr/local/bin/
sudo cp ./wshot.desktop /usr/local/share/applications/
```


## Usage

By default screenshots are saved to `~/tmp/screenshot_*`, edit `FILEDIR=` in `wshot` to change.

If no custom filename is set it defaults to `screenshot_$(date +%F_%H.%M.%S)` e.g. `screenshot_2023-08-07_11.37.18`.

## License

GPL3




