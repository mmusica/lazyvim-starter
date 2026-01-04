return {
  -- Add the adapter plugin itself
  { "rcasia/neotest-java" },

  -- Configure neotest to use the adapter
  {
    "nvim-neotest/neotest",
    dependencies = { "rcasia/neotest-java" },
    opts = {
      -- We use a table key here. LazyVim will automatically
      -- merge this into the adapters list.
      adapters = {
        ["neotest-java"] = {
          jvm_args = {
            "-Djava.util.logging.manager=org.jboss.logmanager.LogManager",
            "-Dquarkus.launcher.test=true",
          },
        },
      },
    },
  },
}
