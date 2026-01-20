-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.filetypes")
-- Add this to the top of your init.lua or before neotest setup
vim.env.JAVA_TOOL_OPTIONS = "-Djava.util.logging.manager=org.jboss.logmanager.LogManager"
