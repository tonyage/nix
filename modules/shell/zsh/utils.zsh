flakify() {
  if [ ! -e flake.nix ]; then
    nix flake new -t github:nix-community/nix-direnv
  elif [ ! -e .envrc ]; then
    echo "use flake" > .envrc
    direnv allow
  fi
  "${EDITOR:-nvim}" flake.nix
}

jvm-flakify() {
  if [ ! -e flake.nix ]; then
    nix flake new -t github:tonyage/nix
  elif [ ! -e .envrc ]; then
    echo "use flake" > .envrc
    direnv allow
  fi
  "${EDITOR:-nvim}" flake.nix
}

