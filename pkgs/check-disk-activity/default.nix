{
  writeShellScriptBin,
  sysstat,
  gnugrep,
  coreutils,
}:
writeShellScriptBin "check-disk-activity" ''
  if [ -z "$1" ]; then
    echo "Usage: check-disk-activity <uuid>" >&2
    exit 1
  fi

  DEVICE_NAME=$(${coreutils}/bin/basename \
              $(${coreutils}/bin/readlink -f /dev/disk/by-uuid/"$1"))

  ${sysstat}/bin/iostat -x -d -y -z 5 1 2>/dev/null | \
  ${gnugrep}/bin/grep -q "$DEVICE_NAME"

  exit $?
''
