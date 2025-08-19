{ lib }: 
let
    transparentize = import ./transparentize { inherit lib; };
in 
{
    inherit transparentize;
}

