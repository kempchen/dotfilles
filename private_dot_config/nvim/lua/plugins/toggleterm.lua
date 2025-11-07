return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    shading_factor = 80,
    float_opts = {
      border = "rounded",
      title_pos = "left",
    },
  },
  keys = {
    -- Popup toggeln im Normal Mode
    { "<C-t>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Terminal (Float)", mode = "n" },
    -- Popup toggeln im Terminal Mode (wichtig!)
    { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "t" },
  },
}
