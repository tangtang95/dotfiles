# dotfiles

My Windows configuration files

## Cmder

Install *cmder-mini* via *Chocolatey*: `choco install cmdermini`

## Starship

*Starship* terminal look with *cmder*. Require to install a nerd font and `starship` (e.g. `choco install starship`). Then add *starship* to `cmder clink` inside `%CMDER_ROOT%/config/cmder_prompt_config.lua`:

```lua
os.setenv('STARSHIP_CONFIG', 'C:\\path\\to\\dotfiles\\starship.toml')

load(io.popen('starship init cmd'):read("*a"))()
```

## Terminal
 
 - Install a [nerdfont](https://www.nerdfonts.com/)
 - Add a new profile for Cmder:
```json
{
    "altGrAliasing": true,
    "antialiasingMode": "grayscale",
    "closeOnExit": "graceful",
    "colorScheme": "One Half Dark",
    "commandline": "cmd.exe /k \"%CMDER_ROOT%\\vendor\\init.bat\"",
    "cursorShape": "bar",
    "font": 
    {
        "size": 12
    },
    "guid": "{c8f3cbf0-230a-431c-a008-eee30338b961}",
    "hidden": false,
    "historySize": 9001,
    "icon": "%CMDER_ROOT%\\icons\\cmder.ico",
    "name": "Cmder",
    "opacity": 100,
    "padding": "8, 8, 8, 8",
    "snapOnInput": true,
    "startingDirectory": "%USERPROFILE%/Documents",
    "useAcrylic": false
}
```
