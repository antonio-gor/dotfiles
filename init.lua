-- ~/.config/nvim/init.lua

-- Automatically install and set up the lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define and configure plugins
require("lazy").setup({
  -- Tokyo Night Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },

  -- Tool installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- tmux & nvim navigation
  { "christoomey/vim-tmux-navigator" },

  -- LSP (Language Server Protocol) support
  { "neovim/nvim-lspconfig" },

  -- Autocompletion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- File explorer tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- Tab-like buffer line
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("bufferline").setup({})
    end,
  },

  -- Automatic bracket closing
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Git indicators
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'tokyonight'
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'filename'},
                lualine_c = {'filesize'},
                lualine_x = {'diagnostics', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            }
        })
    end
  },
  -- Easy code commenting
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  -- Indentation guide lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
})

-- Apply the Tokyo Night colorscheme
vim.cmd.colorscheme "tokyonight"

-- General NeoVim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Key mappings
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Previous tab" })
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { silent = true, desc = "Close tab" })

-- Key mapping to compile and run C++
vim.keymap.set("n", "<F9>", function()
    vim.cmd("write")
    -- Execute terminal command in a split. Note the use of `expand`
    vim.cmd('split | exe "terminal g++ -std=c++17 -Wall -Wextra -O2 ' .. vim.fn.expand('%:p') .. ' -o ' .. vim.fn.expand('%:p:r') .. ' && ' .. vim.fn.expand('%:p:r') .. '"')
end, { desc = "Compile & Run C++ file" })

-- LSP and autocompletion setup
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
      })
    end,
  },
})


-- Autocompletion key mappings and sources
require("cmp").setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = require("cmp").mapping.preset.insert({
    ["<C-Space>"] = require("cmp").mapping.complete(),
    ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
  }),
  sources = require("cmp").config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})

-- Automatically format C++ files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp", "*.c", "*.h", "*.hpp" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
