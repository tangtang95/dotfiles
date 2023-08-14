# dotfiles

My Windows configuration files

## Git
My global git config:
```
[core]
    editor = nvim
[alias]
    prb = pull --rebase
    pfl = push --force-with-lease
    log1l = log --oneline
[push]
    default = current
    autoSetupRemote = true  
```

## Cmder

Install *cmder-mini* via *Scoop*: `scoop install cmder`

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
## Other useful development CLI tools for specific languages

This is a list of tools that can be installed through [scoop](https://scoop.sh):

 - [jabba](https://github.com/Jabba-Team/jabba), java version manager
 - [maven](https://maven.apache.org/), java project manager tool
 - [nvm](https://github.com/coreybutler/nvm-windows), node and npm version manager
 - [miniconda3](https://docs.conda.io/en/latest/miniconda.html), python environment manager
 - [poetry](https://python-poetry.org/), python dependency manager
 - [rustup](https://rustup.rs/), rust manager tool
 - [cmake](https://cmake.org/), c and cpp toolset to build, test and package software
 - [conan](https://conan.io/), c and cpp package manager
 - [vcpkg](https://vcpkg.io/), c and cpp package manager for windows (not in scoop)
 - [kubectl](https://kubernetes.io/docs/user-guide/kubectl-overview/), kubernetes cli
 - [k9s](https://github.com/derailed/k9s), kubernetes tui
 - [lazydocker](https://github.com/jesseduffield/lazydocker), docker tui
 - [kubectl](https://kubernetes.io/docs/user-guide/kubectl-overview/), kubernetes cli
 - [k9s](https://github.com/derailed/k9s), kubernetes tui
 - [lazydocker](https://github.com/jesseduffield/lazydocker), docker tui
 - [aws](https://aws.amazon.com/cli/), aws cli tool
 - [usql](https://github.com/xo/usql), universal sql client with autocompletion and syntax highlighting
