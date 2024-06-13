# Nvim Konfiguration

In diesem Repository verwalte ich meine persönliche Neovim-Konfiguration. Die Einstellungen basieren auf ThePrimeagen's YouTube Tutorial [0 to LSP](https://youtu.be/w7i4amO_zaE?feature=shared) wurden aber stark angepasst (vor allem die Ordnerstruktur). Im Vergleich zu fertigen Konfigurationen wie [AstroVim](https://github.com/AstroNvim/AstroNvim), [LazyVim](https://github.com/LazyVim/LazyVim) oder [NvChad](https://github.com/NvChad/NvChad) ist die Konfiguration "minimal" gehalten.

## Linux
### Nerdfont (optional)
- [runterladen](https://www.nerdfonts.com/font-downloads)
- in `~/.fonts` entpacken: z. B. `unzip CascadiaMono.zip *.ttf -d ~/.fonts`
- `fc-cache -fv`
- Konsole einmal schließen
- In der Konsole als Font einstellen.

### Neovim installieren und konfigurieren
[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) installieren. Bei Errors unstable versuchen:
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
cd ~/.config
git clone https://github.com/Duck-Mc-Muffin/nvim_config.git nvim
```
Terminal einmal neu starten!

### Dependencies
`:checkhealth` listet u.a. fehlende und optionale dependencies auf.
```bash
sudo apt-get install xclip
sudo apt-get install ripgrep
sudo apt-get install jq
```

## Windows
[Windows Terminal](https://www.microsoft.com/store/productId/9N0DX20HK701?ocid=pdpshare) im Shop suchen und installieren.

### [Nerdfont](https://www.nerdfonts.com/font-downloads) (optional)
Im Terminal als Font setzen (Font mit "NerdFont"-Suffix suchen) und Terminal neu starten.
Z. B. [CascadiaMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaMono.zip)

### Neovim installieren und konfigurieren
```shell
winget install Neovim.Neovim
cd %userprofile%\AppData\Local\nvim
git clone https://github.com/Duck-Mc-Muffin/nvim_config.git .
```
Pfad `C:\Program Files\nvim\bin` zu PATH adden und Shell neustarten!

### Dependencies
```shell
winget install BurntSushi.ripgrep.MSVC
winget install hurl
winget install jqlang.jq
```

### C#
Language Server für C# Projekte:
```
:Mason
Installed
  ◍ csharp-language-server csharp_ls
  ◍ html-lsp html
  ◍ lua-language-server lua_ls
  ◍ typescript-language-server tsserver
```
