# My Development Environment

## Core Components

  * **Terminal Emulator**: [WezTerm](https://wezterm.org) - A GPU-accelerated, cross-platform terminal with excellent configuration options in Lua.
  * **Terminal Multiplexer**: [tmux](https://github.com/tmux/tmux/wiki) - Used for managing multiple terminal panes, windows, and for creating persistent, saved sessions.
  * **Text Editor**: [NeoVim](https://neovim.io) - A fast and extensible Vim-based text editor, configured as a lightweight C++ IDE.

## Features

  * **Unified Aesthetics**: A consistent [Tokyo Night](https://github.com/folke/tokyonight.nvim) theme across all components, with a blurred, transparent background.
  * **Seamless Navigation**: Navigate effortlessly between WezTerm, tmux, and NeoVim panes using `Ctrl + h/j/k/l`.
  * **Word-Wise Movement**: Use `Option + Left/Right Arrow` for natural, word-by-word cursor movement in the terminal.
  * **Persistent Sessions**: tmux sessions are automatically saved and restored across machine restarts.
  * **Modern Editor UI**:
      * A file explorer tree toggled with `Ctrl + n`.
      * An interactive buffer list and project-wide fuzzy finder via Telescope.
      * A clean status line (`lualine`) showing Git status, LSP diagnostics, and file info.
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
    brew install wezterm tmux neovim ripgrep
    ```

    *(ripgrep is recommended for Telescope's live grep feature)*

2.  **Clone Configuration Files**:
    Place the configuration files from this repository into their respective locations:

      * `.wezterm.lua` -\> `~/.wezterm.lua`
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

      * Once NeoVim plugins are installed, `mason.nvim` will automatically ensure `clangd` is installed.

4.  **(Optional) Remap Caps Lock to Escape**:
    For a more ergonomic experience, remap your `Caps Lock` key to `Escape` at the operating system level.

      * Go to **System Settings \> Keyboard \> Keyboard Shortcuts... \> Modifier Keys**.
      * Change the **Caps Lock Key** to **⎋ Escape**.

Your setup is now complete\!

## Usage & Keybindings

### Global Navigation

| Key | Action |
| :--- | :--- |
| `Ctrl + h/j/k/l` | Navigate left/down/up/right between any split pane. |
| `Option + ←/→` | Move the cursor word-by-word in the terminal shell. |

### tmux

| Key | Action |
| :--- | :--- |
| `prefix + \|` | Split pane vertically. |
| `prefix + -` | Split pane horizontally. |
| `prefix + r` | Reload the tmux config. |
| `prefix + m` | Zoom the current pane. |
| `prefix + hjkl` | Resize panes. |

### NeoVim

| Key | Action |
| :--- | :--- |
| `Ctrl + n` | Toggle the file explorer tree. |
| `<leader>ff` | Find files in the project (Telescope). |
| `<leader>fg` | Search for text in files (Telescope Live Grep). |
| `<leader>b` | Find and switch between open buffers (Telescope). |
| `<F9>` | Compile and run the current C++ file. |
| `<C-w>` | Close the current buffer/file. |
| `gc` | Toggle comments for a line or selection. |
