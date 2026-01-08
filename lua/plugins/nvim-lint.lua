return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      java = { "checkstyle" },
    },
    linters = {
      checkstyle = {
        args = {
          "-c",
          vim.fn.expand("~/Documents/formatter/eclipse-java-google-style.xml"),
          "$FILENAME",
        },
      },
    },
  },
}
