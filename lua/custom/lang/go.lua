return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup {
      go = "go", -- go command, can be go[default] or e.g. go1.18beta1
      goimports = "goimports", -- goimports command, can be gopls[default] or either goimports or golines if need to split long lines
      gofmt = "gofumpt", -- gofmt through gopls: alternative is gofumpt, goimports, golines, gofmt, etc
      fillstruct = "gopls", -- set to fillstruct if gopls fails to fill struct
      lsp_semantic_highlights = true, -- use highlights from gopls
      lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
      null_ls_document_formatting_disable = true,
      diagnostic = { -- set diagnostic to false to disable vim.diagnostic.config setup,
        -- true: default nvim setup
        hdlr = false, -- hook lsp diag handler and send diag to quickfix
        underline = true,
        virtual_text = { spacing = 2, prefix = "" }, -- virtual text setup
        signs = { "", "", "", "" }, -- set to true to use default signs, an array of 4 to specify custom signs
        update_in_insert = false,
      },
      -- if you need to setup your ui for input and select, you can do it here
      -- go_input = require('guihua.input').input -- set to vim.ui.input to disable guihua input
      -- go_select = require('guihua.select').select -- vim.ui.select to disable guihua select
      lsp_document_formatting = false,
      -- set to true: use gopls to format
      -- false if you want to use other formatter tool(e.g. efm, nulls)
      lsp_inlay_hints = {
        enable = true, -- this is the only field apply to neovim > 0.10

        -- following are used for neovim < 0.10 which does not implement inlay hints
        -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
        style = "inlay",
        -- Note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refersh of the inlay hints.
        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
        -- not that this may cause higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = "CursorHold",
        -- whether to show variable name before type hints with the inlay hints or not
        -- default: false
        show_variable_name = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "󰊕 ",
        show_parameter_hints = true,
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 6,
        -- The color of the hints
        highlight = "Comment",
  
      },
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0) -- Save the current cursor position
        vim.cmd "silent! %!gofumpt | golines --max-len=120"
        vim.api.nvim_win_set_cursor(0, cursor_pos) -- Restore the cursor position
      end,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
