{ lib }: percent : color:
let
    alpha = lib.toHexString (((100 - percent) * 255) / 100);
in
    "${color}${alpha}"

