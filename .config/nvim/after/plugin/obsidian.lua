require("obsidian").setup({
    workspaces = {
        {
            name = "notes",
            path = "~/notes/Obsidian_Vault/"
        },
    },
    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "daily-notes",
        -- Optional, if you want to change the date format for the ID of daily notes.
        -- date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        -- alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        -- template = nil
    },
    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
        -- -- Toggle check-boxes.
        -- ["<leader>of"] = {
        --     action = function()
        --         return require("obsidian").search()
        --     end,
        --     opts = { buffer = true },
        -- },
    },
    ui = {
    -- Define how various check-boxes are displayed
    checkboxes = {
      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      ["/"] = { char = "◐", hl_group = "ObsidianInProgress"},
        },
      hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianInProgress = { bold = true, fg = "#89ddff"},
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
    },
})

-- TODO: learn how to do this in lua
vim.cmd([[
    nnoremap <leader>of :ObsidianQuickSwitch<CR>
    nnoremap <leader>oa :ObsidianSearch<CR>
    nnoremap <leader>ot :ObsidianToday<CR>
    nnoremap <leader>on :ObsidianTomorrow<CR>
    nnoremap <leader>op :ObsidianYesterday<CR>
    nnoremap <leader>oo :ObsidianOpen<CR>
    nnoremap <leader>od :ObsidianDailies -30<CR>
    nnoremap <leader>og :ObsidianTags<CR>
]])
