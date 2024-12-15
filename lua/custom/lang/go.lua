return {
  {
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
        },
        lsp_keymaps = false,
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    keys = {
      { "<leader>lGmt", "<cmd>GoModTidy<cr>", desc = "go mod tidy" },
      { "<leader>lGat", "<cmd>GoAddTag<cr>", desc = "go add tags" },
      { "<leader>lGfs", "<cmd>GoFillStruct<cr>", desc = "go fill struct" },
      { "<leader>lGie", "<cmd>GoIfErr<cr>", desc = "go if err" },
    },
  },
}
