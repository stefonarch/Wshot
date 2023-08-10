# Wshot

>Simple Qt screenshot GUI for wayland.

![Image of wshot](wshot1.png)

## Depends

* grim
* slurp
* qarma
* wl-clipboard

### Optional

* wf-info (to select window under wayfire)
* jq (to select window under sway)

## Install

```
git clone https://github.com/stefonarch/wshot.git
cd wshot
sudo cp ./wshot /usr/local/bin/
```


## Usage

By default screenshots are saved to `~/tmp/screenshot_*`, edit `FILEDIR=` in `wshot` to change.

If no custom filename is set it defaults to `screenshot_$(date +%F_%H.%M.%S)` e.g. `screenshot_2023-08-07_11.37.18`.

**Note**: "Selected window" mode is working only in sway and wayfire at the moment.

Not tested using zenity instead of qarma.

## License

GPL3




