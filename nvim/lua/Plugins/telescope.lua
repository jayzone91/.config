-- plugins/telescope.lua:
return {
  {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.2',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

}
