{ lib }: 
let
    transparentize = import ./transparentize.nix { inherit lib; };
in 
{
    inherit transparentize;
}

