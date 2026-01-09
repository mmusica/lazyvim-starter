return {
  "mfussenegger/nvim-lint",

  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      java = { "checkstyle" },
    },
    linters = {
      checkstyle = {
        args = {
          "-f",
          "sarif",
          "-c",
          vim.fn.expand("~/Documents/efd-checkstyle/checkstyle.xml"),
        },
      },
    },
  },
}
