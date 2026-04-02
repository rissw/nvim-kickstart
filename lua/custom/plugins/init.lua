-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.5,
        -- width = 0.5, -- width of the Zen window
        -- height = 1, -- height of the Zen window
      },
    },
    config = function()
      -- vim.keymap.set('n', '<leader>zm', ':ZenMode<cr>', { desc = '[Z]en [M]ode' })
      vim.keymap.set('n', '<leader>zm', ':lua require("zen-mode").toggle({window={width = .9}})<cr>', { desc = '[Z]en [M]ode' })
      vim.keymap.set('n', '<leader>zn', ':lua require("zen-mode").toggle({window={width = .85}})<cr>', { desc = '[Z]en [M]ode' })
      vim.keymap.set('n', '<leader>zb', ':lua require("zen-mode").toggle({window={width = .80}})<cr>', { desc = '[Z]en [M]ode' })
      vim.keymap.set('n', '<leader>zv', ':lua require("zen-mode").toggle({window={width = .75}})<cr>', { desc = '[Z]en [M]ode' })
      vim.keymap.set('n', '<leader>zc', ':lua require("zen-mode").toggle({window={width = .70}})<cr>', { desc = '[Z]en [M]ode' })
      vim.keymap.set('n', '<leader>zz', ':lua require("zen-mode").toggle({window={width = 150}})<cr>', { desc = '[Z]en [M]ode' })
    end,
  },
  -- {
  --   'Exafunction/codeium.vim',
  --   event = 'BufEnter',
  -- },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
  },

  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>:', '<cmd>FineCmdline<CR>', { noremap = true })
      -- vim.api.nvim_set_keymap('n', '<leader>:', '<cmd>FineCmdline<CR>', { noremap = true })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  -- Amp Plugin
  {
    'sourcegraph/amp.nvim',
    branch = 'main',
    lazy = false,
    opts = { auto_start = true, log_level = 'info' },
  },
  {
    'let-def/texpresso.vim',
    ft = 'tex',
    config = function()
      require('texpresso').texpresso_path = '/home/rads/source/texpresso/build/texpresso'
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
}
