# rcfiles

My configuration files, aliases, and custom scripts.

## Installation

Most of the configurations are setup to be easily installed with GNU `stow`.
Read more about `stow` here: https://www.gnu.org/software/stow/

### bash

```
stow bash
```

Note: When https://github.com/aspiers/stow/issues/33 is resolved, use the
`--dotfiles` option to avoid hidden directories in the repository.

### bin

```
stow bin
```

### bvi

```
stow --dotfiles bvi
```

### gdb

```
stow gdb
```

Note: When https://github.com/aspiers/stow/issues/33 is resolved, use the
`--dotfiles` option to avoid hidden directories in the repository.

### git

```
bash gitconfig.sh
```

### tmux

Depends on custom utilities in `bin`

```
stow --dotfiles tmux
```

### vim

```
stow vim
vim +PluginInstall
```

Note: When https://github.com/aspiers/stow/issues/33 is resolved, use the
`--dotfiles` option to avoid hidden directories in the repository.
