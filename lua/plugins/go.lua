return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("go").setup {
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
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
