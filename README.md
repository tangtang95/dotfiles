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
