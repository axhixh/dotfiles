-- setup lsp and autocompletion
return {
  {
    'saghen/blink.cmp',
    version = '*',
    opts = {
      -- default: similar to built-in completion
      -- super-tab: similarto vscode, tab = accept, arrows = navigate
      -- enter: similar to super-tab, enter = accept
      -- see 'keymap' to create your own
      keymap = { preset = 'enter', },
      appearance = {
        use_nvim_cmp_as_default = true, -- fallback, will be removed in future
        nerd_font_variant = 'mono'
      },
      completion = {
        ghost_text = { enabled = true },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = { 'path', 'buffer' }
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      -- standardml
      require('lspconfig').millet.setup {
        cmd = { 'millet-ls' },
        capabilities = capabilities,
      }

      -- format file on save if the lsp supports formatting
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.api.nvim_create_autocmd('BufWritePre', {
            callback = function()
              vim.lsp.buf.format({
                filter = function(client) return client.supports_method('textDocument/formatting') end
              })
            end,
          })
        end,
      })
    end
  }
}
