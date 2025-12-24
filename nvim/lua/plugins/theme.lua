local dracula = {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("dracula")
    end,
}

local bluloco = {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
      require("bluloco").setup({ style = "dark" })
      vim.cmd.colorscheme("bluloco")
  end,
}

return {
    bluloco
}
