-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "░▒▓████████▓▒░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░", 
            "   ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████▓▒░▒▓█▓▒░      ░▒▓█▓▒░        ", 
            "   ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        ",  
            "   ░▒▓█▓▒░   ░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓████████▓▒░  ░▒▓█▓▒░▒▓██████▓▒░ ░▒▓██████▓▒░   ",  
            "   ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        ",  
            "   ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        ",  
            "   ░▒▓█▓▒░   ░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░        ",  
          }, "\n"),
        },
      },
      picker = {
        formatters = {
          file = {
            truncate = 100,
          }
        }
      },
    },
  },

  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   name = "cyberdream",
  --   config = function()
  --     vim.cmd.colorscheme "cyberdream"
  --   end,
  -- },
  -- {
  --   "tpope/vim-vividchalk",
  --   name = "vividchalk",
  --   config = function()
  --     vim.cmd.colorscheme "vividchalk"
  --   end,
  -- },
	{
		"AstroNvim/astrotheme",
		-- https://github.com/AstroNvim/astrotheme/blob/main/lua/astrotheme/palettes/astrodark.lua
		opts = {
		  palettes = {
			  astrodark = {
				  ui = {
            base         = "#000000",
          -- You can also override these so splits/floats/etc match nicely:
            inactive_base = "#000000",
            float         = "#000000",
            split         = "#000000",

				    red = "#ff8191",
				    orange = "#ffa942",
				    yellow = "#ffcf32",
				    green = "#b0ff7f",
				    cyan = "#5efff5",
				    blue = "#57b6ff",
				    purple = "#eba0ff",
				  },
				  syntax = {
				    red = "#ff8191",
            orange = "#ffa942",
            yellow = "#ffcf32",
            green = "#b0ff7f",
            cyan = "#5efff5",
            purple = "#eba0ff",
            text = "#ADB0BB",
            comment = "#696C76",
            mute =  "#595C66",

				  },

				  term = {
				   black = "#000000",
				   bright_red = "#000000"
				  },
			  },
		  },
		},
	},

}
