return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    local mason_path = vim.fn.stdpath("data") .. "/mason/"
    local jar_pattern = mason_path
      .. "packages/vscode-java-dependency/extension/server/com.microsoft.jdtls.ext.core-*.jar"
    local my_bundle = vim.fn.glob(jar_pattern, true)

    opts.init_options = opts.init_options or {}
    opts.init_options.bundles = opts.init_options.bundles or {}

    -- if my_bundle ~= "" and not vim.tbl_contains(opts.init_options.bundles, my_bundle) then
    --   table.insert(opts.init_options.bundles, my_bundle)
    -- end
    --
    opts.root_dir = function(path)
      local markers = { "pom.xml", "application.properties", ".mvnw", ".gradlew" }
      -- vim.list_extend(markers, vim.lsp.config.jdtls.root_markers)
      return vim.fs.root(path, markers)
    end
    opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
      java = {
        format = {
          enabled = true,
          settings = {
            url = vim.fn.expand("~/Documents/efd-checkstyle/eclipse-formatter.xml"),
            profile = "EFD",
          },
        },
      },
    })

    return opts
  end,
}
