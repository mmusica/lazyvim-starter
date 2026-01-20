local M = {}

local function resolve_java_file(file)
  return vim.fn.systemlist(string.format("rg --files | rg %s", vim.fn.shellescape(file)))
end

function M.stacktrace_to_qf()
  local buf = vim.api.nvim_get_current_buf()

  if vim.bo[buf].buftype ~= "terminal" then
    vim.notify("Not a terminal buffer", vim.log.levels.WARN)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local qf_items = {}

  for _, line in ipairs(lines) do
    local file, lnum = line:match("at%s+.+%(([^:]+):(%d+)%)")

    if file and lnum then
      local resolved = resolve_java_file(file)[1]

      if resolved ~= "" then
        table.insert(qf_items, {
          title = "Java Stacktrace",
          filename = resolved,
          lnum = tonumber(lnum),
          text = line,
          type = "E",
          valid = 1,
        })
      end
    end
  end

  if vim.tbl_isempty(qf_items) then
    vim.notify("No resolvable stacktrace entries found", vim.log.levels.INFO)
    return
  end
  vim.fn.setqflist(qf_items, "r")
  vim.cmd("copen")
end

return M
