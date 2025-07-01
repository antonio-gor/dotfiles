# My Development Environment

This repository documents the configuration for a cohesive and efficient C++ development environment built on a foundation of powerful, modern terminal tools. The setup is designed to be keyboard-driven, aesthetically pleasing, and feature-rich, providing an experience that rivals traditional IDEs.

## Core Components

  * **Terminal Emulator**: [WezTerm](https://wezterm.org) - A GPU-accelerated, cross-platform terminal with excellent configuration options in Lua.
  * **Terminal Multiplexer**: [tmux](https://github.com/tmux/tmux/wiki) - Used for managing multiple terminal panes, windows, and for creating persistent, saved sessions.
  * **Text Editor**: [NeoVim](https://neovim.io) - A fast and extensible Vim-based text editor, configured as a full-fledged C++ IDE.

## Features

  * **Unified Aesthetics**: A consistent [Tokyo Night](https://github.com/folke/tokyonight.nvim) theme across all components, with a blurred, transparent background for a modern look.
  * **Seamless Navigation**: Navigate effortlessly between WezTerm, tmux, and NeoVim panes using `Ctrl + h/j/k/l`.
  * **Word-Wise Movement**: Use `Option + Left/Right Arrow` for natural, word-by-word cursor movement in the terminal.
  * **Persistent Sessions**: tmux sessions are automatically saved and restored across machine restarts, preserving your layouts.
  * **Modern Editor UI**:
      * A file explorer tree toggled with `Ctrl + n`.
      * A clean status line (`lualine`) showing Git status, LSP diagnostics, and file info.
      * A tab-like buffer line to easily manage and switch between open files.
      * Indentation guides for improved code readability.
  * **Full C++ IDE Experience**:
      * **Intelligent Code Completion** via `nvim-cmp` powered by `clangd`.
      * **Auto-formatting on Save** using the Google Style Guide (`clang-format`).
      * **Linting and Diagnostics** provided in real-time by the language server.
      * **One-Press Compile & Run** using the `<F9>` key to build and execute the current file.
      * **Automatic Bracket/Pair Closing** for a smoother coding experience.
      * **Easy Code Commenting** with a universal `gc` key mapping.
  * **Automated Tool Management**: Language servers (`clangd`) are managed within NeoVim via `mason.nvim`, simplifying installation and updates.

## Installation

These instructions assume you are on macOS with [Homebrew](https://brew.sh) installed.

1.  **Install Core Applications**:
    ```bash
    brew install wezterm tmux neovim
    ```
2.  **Clone Configuration Files**: Place the configuration files from the "Configuration Files" section below into their respective locations:
      * `wezterm.lua` -\> `~/.wezterm.lua`
      * `.tmux.conf` -\> `~/.tmux.conf`
      * `init.lua` -\> `~/.config/nvim/init.lua` (you may need to create the `nvim` directory).
3.  **Install tmux Plugin Manager (TPM)**:
    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

## First-Time Setup

After the configuration files are in place, follow these steps to initialize all plugins and tools.

1.  **Install tmux Plugins**:
      * Launch `tmux`.
      * Press `prefix + I` (that's a capital 'I') to fetch all plugins defined in `.tmux.conf`. The default prefix is `Ctrl + b`.
2.  **Install NeoVim Plugins**:
      * Launch `nvim`.
      * The plugin manager, `lazy.nvim`, will automatically start and install all the plugins defined in `init.lua`. This may take a minute.
3.  **Install Development Tools with Mason**:
      * Once NeoVim plugins are installed, run the Mason command inside NeoVim to ensure `clangd` is installed:
        ```
        :MasonInstall clangd
        ```

Your setup is now complete\!

## Usage & Keybindings

### Global Navigation

| Key                | Action                                                     |
| ------------------ | ---------------------------------------------------------- |
| `Ctrl + h/j/k/l`   | Navigate left/down/up/right between any split pane.        |
| `Option + ←/→` | Move the cursor word-by-word in the terminal shell.      |

### tmux

| Key             | Action                      |
| --------------- | --------------------------- |
| `prefix + |`    | Split pane vertically.      |
| `prefix + -`    | Split pane horizontally.    |
| `prefix + r`    | Reload the tmux config.     |
| `prefix + m`    | Zoom the current pane.      |
| `prefix + hjkl` | Resize panes.               |

### NeoVim

| Key                | Action                                |
| ------------------ | ------------------------------------- |
| `Ctrl + n`         | Toggle the file explorer tree.        |
| `Tab`              | Cycle to the next open file (buffer). |
| `<S-Tab>` (Shift+Tab) | Cycle to the previous open file.      |
| `Ctrl + w`         | Close the current file.               |
| `<F9>`             | Compile and run the current C++ file. |
| `gc`               | Toggle comments for a line or selection. |

-----

## Configuration Files

