# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with extensive customizations. It uses Lua for configuration and lazy.nvim as the plugin manager.

## Common Commands

### Plugin Management
- `:Lazy` - Open Lazy plugin manager UI to view, install, update, or remove plugins
- Plugins are automatically installed on first startup

### LSP and Development Tools
- `:Mason` - Open Mason UI to manage LSP servers, formatters, linters, and DAP servers
- `:MasonInstall <tool>` - Install specific tool
- `:ConformInfo` - Show active formatters for current buffer
- `<leader>F` - Format current buffer (auto-format on save is enabled)

### Health Check
- `:checkhealth` - Verify Neovim and plugin health, check for missing dependencies

## Architecture

### Directory Structure
```
nvim/
├── init.lua                    # Main entry point, core configuration
├── lazy-lock.json             # Plugin version lock file
└── lua/
    ├── custom-bindings.lua    # Custom keybindings
    ├── custom/
    │   ├── plugins/           # Custom plugin configurations
    │   ├── lang/             # Language-specific configs (e.g., go.lua)
    │   ├── formatter/        # Formatter configurations
    │   └── lspconfig/        # LSP server configurations
    └── kickstart/
        ├── plugins/          # Kickstart default plugins
        └── health.lua        # Health check configuration
```

### Plugin System

Plugins are managed by lazy.nvim with three loading patterns:

1. **Inline in init.lua**: Simple plugins without config
   ```lua
   "tpope/vim-sleuth"
   ```

2. **Table with config in init.lua**: Plugins with inline configuration
   ```lua
   {
     "lewis6991/gitsigns.nvim",
     opts = { ... }
   }
   ```

3. **Modular files**: Complex plugins in separate files
   ```lua
   -- In init.lua:
   require "custom.plugins.ai"
   
   -- In lua/custom/plugins/ai.lua:
   return {
     {
       "plugin/name",
       dependencies = { ... },
       config = function() ... end
     }
   }
   ```

### Adding New Plugins

To add a new plugin:
1. For simple plugins: Add to the plugin list in `init.lua`
2. For complex plugins: Create `lua/custom/plugins/your-plugin.lua` and add `require "custom.plugins.your-plugin"` to init.lua

### Key Development Features

- **LSP**: Configured via Mason with auto-installation
- **Formatting**: Conform.nvim with auto-format on save
- **Linting**: nvim-lint with automatic linting
- **Treesitter**: Auto-installs parsers for detected languages
- **Completion**: nvim-cmp with multiple sources

### Important Keybindings

- `<leader>` is set to space
- `<leader>w` - Save file
- `<leader>q` - Quit buffer
- `<leader>F` - Format buffer
- `gd` - Go to definition (LSP)
- `gr` - Find references (LSP)
- `<leader>la` - Code action (LSP)
- `<leader>lr` - Rename symbol (LSP)

### Dependencies

External tools required:
- `git`, `make`, `unzip`, C compiler (`gcc`)
- `ripgrep` for searching
- Clipboard tool (system-specific)
- Language servers installed via Mason as needed