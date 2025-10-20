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
    { "<leader>kl", "<C-w>l", desc = "Navigate to right split" },
    { "<leader>kw", "<C-w>|", desc = "Set the window width" },
    { "<leader>ks", "<C-w>_", desc = "set the window height" },
    { "<leader>ke", "<C-w>=", desc = "Equalize width and height of all windows" }

  },

  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "copilot",
    auto_suggestions_provider = nil,
    mode = "agentic",
    input = "snacks",
    providers = {
      copilot = {
        proxy = nil, 
        allow_insecure = false, 
        timeout = 30000,
        context_window = 32000, -- Number of tokens to send to the model for context
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 10240,
        },
      },
    }
  },

  dependencies = {
    -- core runtime deps
    "nvim-treesitter/nvim-treesitter", 
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- optional dependencies
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "stevearc/dressing.nvim", -- input provider dressing
    "folke/snacks.nvim", -- input provider snacks
    "zbirenbaum/copilot.lua", -- copilot provider
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },

  -- This is temporarily disabled while I'm figuring out the copilot access
  --
  -- config = function()
  --   require('avante').setup {
  --     -- system_prompt as function ensures LLM always has latest MCP server state
  --     -- This is evaluated for every message, even in existing chats
  --     system_prompt = function()
  --       local hub = require('mcphub').get_hub_instance()
  --       return hub and hub:get_active_servers_prompt() or ''
  --     end,
  --     -- Using function prevents requiring mcphub before it's loaded
  --     custom_tools = function()
  --       return {
  --         require('mcphub.extensions.avante').mcp_tool(),
  --       }
  --     end,
  --   }
  -- end,
}
