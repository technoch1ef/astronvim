return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false, -- always build latest
    keys = {
      { "<leader>ac", "<CMD>AvanteChat<CR>", desc = "avante: chat"    },
    },

  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "copilot",
    input = "snacks",
  },

  dependencies = {
    -- core runtime deps
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- AI provider
    "zbirenbaum/copilot.lua",

    -- input UI
    {
      "folke/snacks.nvim",
      opts = {
        -- default Snacks settings are fine, override here if needed
      },
    },
  },
}
