local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'airblade/vim-gitgutter'
  use 'chriskempson/base16-vim'
  use 'easymotion/vim-easymotion'
  use 'heavenshell/vim-jsdoc'
  use 'nathanaelkane/vim-indent-guides'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-jdaddy'
  use 'ntpeters/vim-better-whitespace'
  use 'simnalamburt/vim-mundo'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'terryma/vim-multiple-cursors'
  use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
  use 'itchyny/lightline.vim'
  use 'sheerun/vim-polyglot'
  use 'dhruvasagar/vim-table-mode'
  use 'delphinus/vim-firestore'
  use 'myint/indent-finder'
  use 'rust-lang/rust.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'kamykn/spelunker.vim'
  use 'neoclide/vim-jsx-improve'
  use 'kamykn/popup-menu.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'amadeus/vim-convert-color-to'
  use 'nat-418/boole.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.opt.termguicolors = true

require('chatgpt').setup()

require('boole').setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
  },
  -- User defined loops
  additions = {
    {'Foo', 'Bar'},
    {'tic', 'tac', 'toe'}
  },
  allow_caps_additions = {
    {'enable', 'disable'}
    -- enable → disable
    -- Enable → Disable
    -- ENABLE → DISABLE
  }
})



-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end

-- local packer_bootstrap = ensure_packer()

-- return require('packer').startup(function(use)

--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if packer_bootstrap then
--     require('packer').sync()
--   end
-- end)

-- require('nvim-treesitter.configs').setup {
--   ensure_installed = "all",
--   auto_install = true,
-- }

require'treesitter-context'.setup{
  enable = true,
  max_lines = 5,
  min_window_height = 50, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
}

require 'colorizer'.setup()
