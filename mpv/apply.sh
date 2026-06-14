#!/usr/bin/env bash
set -euo pipefail

command="${1:-apply}"

resolve_config_home() {
  if [[ -n "${XDG_CONFIG_HOME:-}" ]]; then
    printf '%s\n' "$XDG_CONFIG_HOME"
    return
  fi
  printf '%s/.config\n' "${HOME:?HOME must be set}"
}

config_dir="$(resolve_config_home)/mpv"
config_file="$config_dir/mpv.conf"
include_line='include="noctalia-colors.conf"'

has_include() {
  grep -Eq '^[[:space:]]*include[[:space:]]*=[[:space:]]*"?noctalia-colors\.conf"?([[:space:]]|$)' "$config_file"
}

apply_include() {
  mkdir -p "$config_dir"
  if [[ ! -f "$config_file" ]]; then
    printf '%s\n' "$include_line" >"$config_file"
    return
  fi
  if has_include; then
    return
  fi
  printf '\n%s\n' "$include_line" >>"$config_file"
}

case "$command" in
  apply) apply_include ;;
  *)
    echo "Usage: $0 apply" >&2
    exit 1
    ;;
esac