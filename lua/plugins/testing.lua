-- ~/.config/nvim/lua/plugins/testing.lua
return {
    "vim-test/vim-test",
    event = "VeryLazy",
    keys = {
      { "<leader>T",  "<NOP>",                desc = "Tests"        },
      { "<leader>Tn", "<CMD>TestNearest<CR>", desc = "Test nearest" },
      { "<leader>Tf", "<CMD>TestFile<CR>",    desc = "Test file"    },
      { "<leader>Ts", "<CMD>TestSuite<CR>",   desc = "Test suite"   },
      { "<leader>Tl", "<CMD>TestLast<CR>",    desc = "Test last"    },
      { "<leader>Tw", "<CMD>TestWatch<CR>",   desc = "Test watch"   },
      { "<leader>To", "<CMD>TestOutput<CR>",  desc = "Test output"  },
    },

    config = function()
      -- ‣ Set vim-test strategy:
      --    ───────────────────────
      -- “neovim” will open a built-in :terminal split
      -- “toggleterm” opens a floating ToggleTerm window
      vim.g["test#strategy"] = "toggleterm"
      vim.g["test#echo_command"] = 0

      --
      -- ‣ (Optional) if you want vim-test to send output to quickfix:
      --    ─────────────────────────────────────────────────────────
      -- vim.g["test#preserve_screen"] = 1
      -- vim.g["test#runner_output"] = "quickfix"

      -- ──────── Configure ToggleTerm for a larger float ─────────
      local has_toggleterm, toggleterm = pcall(require, "toggleterm")
      if has_toggleterm then
        toggleterm.setup({
          -- Open in a floating window instead of a split
          direction = "float",

          -- You can choose either fixed width/height:
          float_opts = {
            border = "double",
            -- Set a fixed size (e.g. 80×20):
            width  =  math.floor(vim.o.columns * 0.8),
            height =  math.floor(vim.o.lines   * 0.6),
          },

          -- If you prefer dynamic sizing (e.g. 70% of editor size),
          -- comment out float_opts above and uncomment below:
          -- size = function(term)
          --   return {
          --     width  = math.floor(vim.o.columns * 0.7),
          --     height = math.floor(vim.o.lines   * 0.5),
          --   }
          -- end,

          -- You can still toggle with <c-\> if you like:
          open_mapping = [[<c-\>]],
        })
      end
    end,
  }
