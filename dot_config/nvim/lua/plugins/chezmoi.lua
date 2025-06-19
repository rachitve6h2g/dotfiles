return {
  "andre-kotake/nvim-chezmoi",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  opts = {
    -- Your custom config
  },
  config = function(_, opts)
    require("nvim-chezmoi").setup(opts)
  end,
}
