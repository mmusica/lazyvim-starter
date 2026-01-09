return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = true,
    },
    autoformat = false,
  },

  servers = {
    jdtls = {},
  },
  setup = {
    jdtls = function()
      return true -- avoid duplicate servers
    end,
  },
}
