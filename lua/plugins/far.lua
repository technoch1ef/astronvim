return {
  'MagicDuck/grug-far.nvim',
  keys = {
    { "leader>F", "NOP", desc = "Find and replace" },
    { "<leader>Fr", ":GrugFar<CR>", desc = "Open a find and replace buffer" },
    { "<leader>Fw", ":GrugFarWithin", desc = "Find and replace within range" }
  },
}
