return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local mason_path = vim.fn.stdpath("data") .. "/mason/"

    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          -- Adjust these paths based on what you actually install in Mason
          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand(mason_path .. "share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        "python",
        "cpp",
      },
    })
  end,
}
