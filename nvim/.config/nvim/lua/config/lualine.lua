-- local function lsp_progress(_, is_active)
--   local messages = vim.lsp.util.get_progress_messages()
--   local status = {}
--   local spinners = {
--     "⠋",
--     "⠙",
--     "⠹",
--     "⠸",
--     "⠼",
--     "⠴",
--     "⠦",
--     "⠧",
--     "⠇",
--     "⠏",
--   }
--   local ms = vim.loop.hrtime() / 1000000
--   local frame = math.floor(ms / 120) % #spinners
--
--   if not is_active then
--     return
--   end
--
--   if #messages == 0 then
--     return ""
--   end
--
--   for _, msg in pairs(messages) do
--     local title = ""
--     if msg.title then
--       title = msg.title
--     end
--     table.insert(status, (msg.percentage or 0) .. "%% " .. title)
--   end
--
--   return table.concat(status, "  ") .. " " .. spinners[frame + 1]
-- end

-- vim.cmd("au User LspProgressUpdate let &ro = &ro")

-- local function lsp_name()
--   local msg = "No Active Lsp"
--   local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--   local clients = vim.lsp.get_active_clients()
--   if next(clients) == nil then
--     return msg
--   end
--   local client_names = {}
--   for _, client in ipairs(clients) do
--     local filetypes = client.config.filetypes
--     if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--       client_names[client.name] = true
--     end
--   end
--   if next(client_names) then
--     local names = ""
--     for k, _ in pairs(client_names) do
--       if names == "" then
--         names = k
--       else
--         names = names .. "," .. k
--       end
--     end
--     return names
--   end
--   return msg
-- end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_c = {
      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = { left = 1, right = 0 },
      },
      {
        "filename",
        path = 1,
        symbols = { modified = "  ", readonly = "", unnamed = "" },
      },
    },

    lualine_x = {}, -- { "diagnostics", sources = { "nvim_diagnostic" } } },
    lualine_y = {}, -- lsp_name }, lsp_progress },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
