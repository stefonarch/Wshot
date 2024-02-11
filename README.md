# Wshot

> Simple Qt screenshot GUI for Wayland.

![Image of wshot](wshot1.png)

## Depends

* grim
* slurp
* qarma / zenity
* wl-clipboard

### Optional

* cmake (to build/update translations and install the application)
* git (to pull latest VCS checkouts)
* wf-info (to select window under wayfire)
* jq (to select window under sway)

## Build / Install

`CMAKE_INSTALL_PREFIX` has to be set to `/usr` on most operating systems.<br />
Using `sudo make install` is discouraged, use the system package manager
instead where possible.

```bash
cmake -B build -D CMAKE_INSTALL_PREFIX=/usr -W no-dev
cmake --build build --verbose
DESTDIR="$(pwd)/package" cmake --install build
```

## Usage

By default screenshots are saved to `~/tmp/screenshot_*`, edit `FILEDIR=` in `wshot` to change.

If no custom filename is set it defaults to `screenshot_$(date +%F_%H.%M.%S)` e.g. `screenshot_2023-08-07_11.37.18`.

**Note**

* "Selected window" mode is working only in sway, hyprland (floating windows only) and wayfire at the moment.

* Using zenity checkboxes are not supported and replaced by combos.

* Only wlroots-based compositor are supported.

## Packages

[![Packaging status]](https://repology.org/project/wshot/versions)

## Translations

Translations can be added in [weblate platform](https://translate.lxqt-project.org/projects/qtilities/wshot/).

<a href="https://translate.lxqt-project.org/engage/qtilities/?utm_source=widget">
<img src="https://translate.lxqt-project.org/widgets/qtilities/-/wshot/multi-auto.svg" alt="Translation status" />
</a>

## Licenses

Wshot is licensed under the [GPL3] license.<br/>
Icon comes from the [nuoveXT2.2] icon set by sa-ki, LGPL3 license.


[GPL3]:             COPYING
[nuoveXT2.2]:       https://www.deviantart.com/sa-ki/art/nuoveXT-2-53518454
[Packaging status]: https://repology.org/badge/vertical-allrepos/wshot.svg
