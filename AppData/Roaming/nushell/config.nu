# Nushell Config File
#
# version = "0.101.0"

use ~/AppData/Roaming/nushell/themes/catppuccin-mocha.nu

let carapace_completer = {|spans|
  # if the current command is an alias, get it's expansion
  let expanded_alias = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion)

  # overwrite
  let spans = (if $expanded_alias != null  {
    # put the first word of the expanded alias first in the span
    $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
  } else {
      $spans
    })

  carapace $spans.0 nushell ...$spans
  | from json
}
let zoxide_completer = {|spans|
  $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

let external_completer = {|spans|
  let expanded_alias = scope aliases
  | where name == $spans.0
  | get -o 0.expansion

  let spans = if $expanded_alias != null {
    $spans
    | skip 1
    | prepend ($expanded_alias | split row ' ' | take 1)
  } else {
    $spans
  }

  match $spans.0 {
  # use zoxide completions for zoxide commands
  __zoxide_z | __zoxide_zi => $zoxide_completer
  _ => $carapace_completer
} | do $in $spans
}

$env.config = {
  show_banner: false
  rm: {
    always_trash: false # always act as if -t was given. Can be overridden with -p
  }

  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true    # set this to false to prevent auto-selecting completions when only one remains
    partial: true    # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"    # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 10 # setting it lower can improve completion performance at the cost of omitting some options
      completer: $external_completer # check 'carapace_completer' above as an example
    }
    use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
  }

  color_config: (catppuccin-mocha)

  shell_integration: {
    osc2: true,
    osc7: true,
    osc8: true,
    osc9_9: true,
    # disable osc133 and osc633 for bug https://github.com/nushell/nushell/issues/5585
    osc133: false,
    osc633: false,
    reset_application_mode: true
  }
}

# Aliases
alias vim = nvim
alias pbpaste = powershell -command Get-ClipBoard
alias pbcopy = clip
alias e. = explorer .
alias k = kubectl
alias lsn = ls
alias ls = eza
alias aws-cred-set = ~/SiemensProjects/aws-cred-set.bat
alias pk8s = python ~/SiemensProjects/incubator/k8s-port-forward/k8s_port_forward.py

# Modules
source ~/AppData/Roaming/nushell/modules/.zoxide.nu

