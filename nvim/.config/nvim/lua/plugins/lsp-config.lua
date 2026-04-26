return {
  {
    "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "clangd", "pyright", "emmet_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.emmet_ls.setup({
        filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" }, 
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end

  }


}
