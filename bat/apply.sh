#!/usr/bin/env bash
set -euo pipefail

resolve_config_home() {
  if [[ -n "${XDG_CONFIG_HOME:-}" ]]; then
    printf '%s\n' "$XDG_CONFIG_HOME"
    return
  fi
  printf '%s/.config\n' "${HOME:?HOME must be set}"
}

config_dir="$(resolve_config_home)/bat"
config_file="$config_dir/config"
theme_line='--theme="Noctalia"'

apply_theme_flag() {
  mkdir -p "$config_dir"
  if [[ ! -f "$config_file" ]]; then
    printf '%s\n' "$theme_line" >"$config_file"
    return
  fi
  if grep -Eq '^[[:space:]]*--theme[[:space:]]*=[[:space:]]*"?Noctalia"?([[:space:]]|$)' "$config_file"; then
    return
  fi
  printf '\n%s\n' "$theme_line" >>"$config_file"
}

apply_theme_flag