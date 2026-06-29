# Nuramem Homebrew tap

Homebrew formula for the **`nura`** CLI — cross-model memory from the terminal.

```sh
brew install nuramem/tap/nura
```

`nura` is the command-line client for [Nuramem](https://nuramem.ai): capture into
your memory (`nura save`) and recall it (`nura search`, `nura briefing`) from the
shell or CI, wire Nuramem's MCP server into your AI clients (`nura connect`), and
install the memory skill (`nura skill install`).

The formula installs a standalone binary (no Python toolchain required), built and
published by the [`nuramem`](https://github.com/oaraya-hl/nuramem) release pipeline.

Other ways to install: `pipx install nuramem` · `uvx nuramem` ·
`curl -fsSL https://get.nuramem.ai | sh`.
