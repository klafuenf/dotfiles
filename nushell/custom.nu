
source ( $nu.default-config-dir | path join zoxide.nu )
source ( $nu.default-config-dir | path join broot.nu )
source ( $nu.default-config-dir | path join starship.nu )

alias l = eza -ag
alias ll = eza -lag
alias pnc = sed 's/\x1B\[[0-9;]*[mGK]//g'

def --env lfcd [
  --args (-a): string
] {
  let cmd_file = (mktemp | str trim)
  if ($args | is-empty) {
    ^lf -last-dir-path $cmd_file
  } else {
    ^lf -last-dir-path $cmd_file $args
  }
  let cmd = ((open $cmd_file) | str trim)
  rm $cmd_file
  cd $cmd 
}

def --env brcd [p:string] {
  let cmd_file = (mktemp | str trim)
  ^broot --only-folders --commands $"($p);:cd" --outcmd $cmd_file
  let cmd = ((open $cmd_file) | str trim)
  rm $cmd_file
  echo $cmd
  cd ($cmd | str replace "cd " "" | str trim)
}

#search for specific process
def psn [name: string] {
  ps | find $name
}

#kill specified process in name
def killn [name: string] {
  ps | find $name | each {kill -f $in.pid}
}

def --env ya [] {
    let tmp = (mktemp | str trim)
    yazi --cwd-file $tmp
    let cwd = ((open $tmp) | str trim)
    cd $cwd
    rm -f $tmp
}

