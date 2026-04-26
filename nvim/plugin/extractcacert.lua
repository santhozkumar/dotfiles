local function create_floating_window(title, lines)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  local win = vim.api.nvim_open_win(buf, true, {
    title = " " .. title .. " ",
    title_pos = "center",
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })
  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })
end

local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_row = start_pos[2]
  local end_row = end_pos[2]
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  return table.concat(lines, "\n")
end

local function extractcacert()
  local pem = get_visual_selection()
  if not pem or pem == "" then
    vim.notify("No text selected", vim.log.levels.WARN)
    return
  end

  local result = vim.system(
    { "openssl", "x509", "-text", "-noout" },
    { stdin = pem }
  ):wait()

  if result.code ~= 0 then
    vim.notify("openssl error: " .. (result.stderr or "unknown"), vim.log.levels.ERROR)
    return
  end

  local output_lines = vim.split(result.stdout, "\n", { trimempty = true })
  create_floating_window("Certificate Details", output_lines)
end

vim.api.nvim_create_user_command("ExtractCACert", extractcacert, {})
vim.keymap.set("v", "<leader>ce", ":<C-u>lua vim.cmd('ExtractCACert')<CR>", { desc = "Extract and display CA certificate" })
