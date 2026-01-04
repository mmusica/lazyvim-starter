return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- This tells conform to use prettierd for html files
        html = { "prettierd", "prettier", stop_after_first = true },
        angular = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
