return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "mfussenegger/nvim-jdtls",
  },
  config = function()
    local mason_path = vim.fn.stdpath("data") .. "/mason/"

    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",

          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarjava.jar"),
          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarjs.jar"),
        },
      },
      filetypes = {
        "python",
        "cpp",
        "java",
        "js",
        "ts",
      },
    })
  end,
}
