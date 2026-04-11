if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
-- In AstroNvim v6, treesitter config is handled through AstroCore opts,
-- not nvim-treesitter directly. nvim-treesitter is now just a parser
-- download utility.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = {
        "lua",
        "vim",
        -- add more parsers here
      },
    },
  },
}
