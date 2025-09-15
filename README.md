# dotfiles

My Windows configuration files

## Starship

Require to install a nerd font and `starship`. Make sure to have also clink installed (previous section)
To load the starship config, make sure to put the `starship.toml` in the `~/.config` folder by doing a symbolic link

## Terminal (WezTerm)

- Install a [nerdfont](https://www.nerdfonts.com/)
- Install WezTerm via *scoop*
- To load the config file of WezTerm put the `wezterm` folder into .config folder using a symbolic link

## Terminal (Alacritty)

- If there are unalignment with nerd font icons, copy `conpty.dll` and `OpenConsole.exe` from Wezterm to `alacritty.exe` directory

## Other useful development CLI tools for specific languages

This is a list of tools that can be installed through [scoop](https://scoop.sh):

- [jabba](https://github.com/Jabba-Team/jabba), java version manager (does not work well when installed via scoop, install it via chocolatey or something else)
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
- [aws](https://aws.amazon.com/cli/), aws cli tool
- [usql](https://github.com/xo/usql), universal sql client with autocompletion and syntax highlighting (in January of 2024, it does not work well in Windows)
- *psql*, coming with postgresql

