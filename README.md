# herdr-lazygit

A centered [lazygit](https://github.com/jesseduffield/lazygit) popup for
[Herdr](https://herdr.dev), opened on the git repository of the pane you are
already in.

```sh
herdr plugin install kvoon3/herdr-lazygit
```

Add the binding to `config.toml`, then `herdr server reload-config`:

```toml
[[keys.command]]
key = "prefix+shift+l"
type = "shell"
command = "\"$HERDR_BIN_PATH\" plugin pane open --plugin kvoon.herdr-lazygit --entrypoint lazygit"
description = "Open lazygit"
```

Requires `lazygit` on `PATH` and Herdr 0.7.0+. A plain `[[keys.command]]` popup
bakes in its `cwd` at config-load time, so it cannot follow the pane you press
the key in; this popup reads `focused_pane_cwd` from the plugin context instead.
Arguments after `--` reach lazygit, e.g. `... --entrypoint lazygit -- --filter src/`.

MIT
