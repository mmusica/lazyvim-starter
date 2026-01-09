return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local mason_path = vim.fn.stdpath("data") .. "/mason/"

      opts.init_options = opts.init_options or {}
      opts.init_options.bundles = opts.init_options.bundles or {}

      local vscode_java_dep = vim.fn.glob(
        mason_path .. "packages/vscode-java-dependency/extension/server/com.microsoft.jdtls.ext.core-*.jar",
        true
      )

      if vscode_java_dep ~= "" then
        table.insert(opts.init_options.bundles, vscode_java_dep)
      end

      opts.settings = opts.settings or {}
      opts.settings.java = vim.tbl_deep_extend("force", opts.settings.java or {}, {
        format = {
          enabled = true,
          settings = {
            url = vim.fn.expand("~/Documents/efd-checkstyle/eclipse-formatter.xml"),
            profile = "EFD",
          },
        },
      })
    end,
  },
}
