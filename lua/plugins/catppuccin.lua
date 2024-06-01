return {
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = true,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        neotree = true,
        telescope = true,
        gitsigns = true,
        rainbow_delimiters = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
      },
    },
  },
}
