return {
  "aserowy/tmux.nvim",
  -- lazy = false,
  event = "VeryLazy",
  config = function()
    return require("tmux").setup()
  end,
}
