gi() {
  curl -sL https://www.gitignore.io/api/$argv >> ./.gitignore;
}

flakify() {
  if [ ! -e flake.nix ]; then
    nix flake new -t github:nix-community/nix-direnv
  elif [ ! -e .envrc ]; then
    echo "use flake" > .envrc
    direnv allow
  fi
  "${EDITOR:-nvim}" flake.nix
}
