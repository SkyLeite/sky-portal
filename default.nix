{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  # specify which packages to add to the shell environment
  packages = [ pkgs.elixir pkgs.nodejs-14_x pkgs.python pkgs.python38 ];
  # add all the dependencies, of the given packages, to the shell environment
  inputsFrom = with pkgs; [ ];
}
