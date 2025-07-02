return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false, -- always build latest
  keys = {
    { "<leader>a", "NOP", desc = "Avante" },
    { "<leader>ac", "<CMD>AvanteChat<CR>", desc = "avante: chat" },
    { "<leader>ab", "<CMD>AvanteBuild<CR>", desc = "avante: build" },

    { "<leader>k", "<NOP>", desc = "Split screen" },
    { "<leader>ks", ":split<CR>", desc = "Horizontal split" },
    { "<leader>kv", ":vsplit<CR>", desc = "Vertical split" },
    { "<leader>kc", ":close<CR>", desc = "Close split" },
    { "<leader>kh", "<C-w>h", desc = "Navigate to left split" },
    { "<leader>kj", "<C-w>j", desc = "Navigate to bottom split" },
    { "<leader>kk", "<C-w>k", desc = "Navigate to top split" },
    { "<leader>kl", "<C-w>l", desc = "Navigate to right split" }
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
