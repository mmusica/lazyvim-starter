return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function(_, opts)
          opts.settings = {
            java = {
              format = {
                enabled = true,
                settings = {
                  url = "~/Documents/formatter/eclipse-java-google-style.xml",
                  profile = "EFD",
                },
              },
            },
          }
        end,
      },
    },
  },
}
