# luxus-noctalia-templates

Personal Noctalia v5 app theme templates for the luxus fleet. Not part of [luxusAi](https://github.com/luxusAi/luxusAi) — app colors live here, Nix only installs Noctalia and compositor structure.

## How this fits Noctalia

Noctalia has three template layers:

| Layer | Source | Enable via |
|-------|--------|------------|
| **Built-in** | Shipped with the `noctalia` package | `builtin_ids` in Settings → Templates |
| **Community** | [noctalia-dev/community-templates](https://github.com/noctalia-dev/community-templates) via `api.noctalia.dev` | `community_ids` in Settings |
| **User (this repo)** | Clone + register in config | `[theme.templates.user.<id>]` entries |

v5 does **not** support registering an arbitrary git URL as a second community catalog. Wire this repo by cloning it and pointing user templates at files inside the clone.

Reference layouts:

- Community catalog: [community-templates](https://github.com/noctalia-dev/community-templates)
- Built-in catalog: [noctalia `assets/templates/`](https://github.com/noctalia-dev/noctalia/tree/main/assets/templates)

## Setup

```bash
git clone https://github.com/luxusAi/luxus-noctalia-templates.git ~/src/luxus-noctalia-templates
```

Copy the snippets from [`user-templates.example.toml`](user-templates.example.toml) into `~/.local/state/noctalia/settings.toml` under `[theme.templates.user.*]` (or merge into `~/.config/noctalia/config.toml` if you use that).

List what Noctalia sees:

```bash
noctalia theme --list-templates
```

Re-apply after palette changes: toggle a template off/on in Settings, or restart `noctalia`.

## Adding a template

1. Create `app-name/template.toml` (catalog metadata + paths — same shape as community-templates).
2. Add the template file(s) with Noctalia tokens, e.g. `{{colors.primary.dark.hex}}`.
3. Add an `apply.sh` if the app needs an `include` line or reload hook.
4. Register in `user-templates.example.toml` and your live Noctalia config.
5. Prefer upstreaming generic templates to [community-templates](https://github.com/noctalia-dev/community-templates) instead of keeping them here forever.

## Templates in this repo

| App | Why here |
|-----|----------|
| [mpv](mpv/) | Not in community catalog; fleet uses `rum.programs.mpv` on lea |

Apps already covered elsewhere — use those instead of duplicating:

- **Built-in:** `ghostty`, `starship`, `niri`, `hyprland`, `kcolorscheme`, `gtk3`, `gtk4`, …
- **Community:** `zed`, `discord`, `yazi`, `neovim`, `fuzzel`, `telegram`, …