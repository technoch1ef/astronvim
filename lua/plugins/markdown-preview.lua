return {
  "drewipson/glowing-vim-markdown-preview",
  ft = "markdown",
  keys = {
    { "<Leader>md", function() _G.GlowPreview.toggle "float" end, desc = "Preview markdown (float)" },
    { "<Leader>ms", function() _G.GlowPreview.toggle "split" end, desc = "Preview markdown (split)" },
  },
  init = function()
    -- Register the which-key group so `<Leader>m` shows a "Markdown" menu
    local ok, wk = pcall(require, "which-key")
    if ok then wk.add { { "<Leader>m", group = "Markdown" } } end
  end,
  config = function()
    -- NOTE: We deliberately do NOT source the upstream markdown-preview.vim.
    -- It gates the glow path on has('terminal') (always 0 in Neovim) and uses a
    -- `:terminal` + feedkeys approach that leaves a stray terminal buffer behind.
    -- This is a clean Neovim-native reimplementation that renders with glow in a
    -- single managed window (float for `md`, vertical split for `ms`).

    local state = { win = nil, buf = nil }

    local function close_preview()
      if state.win and vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_close(state.win, true)
      end
      if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
        vim.api.nvim_buf_delete(state.buf, { force = true })
      end
      state.win, state.buf = nil, nil
    end

    local function open_preview(mode)
      if vim.fn.executable "glow" == 0 then
        vim.notify("glow is not installed (brew install glow)", vim.log.levels.ERROR)
        return
      end

      -- Snapshot the current buffer's content to a temp file for glow to render.
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local tmp = vim.fn.tempname() .. ".md"
      vim.fn.writefile(lines, tmp)

      local buf = vim.api.nvim_create_buf(false, false)
      local win, glow_w

      if mode == "float" then
        local W = math.floor(vim.o.columns * 0.85)
        local H = math.floor(vim.o.lines * 0.85)
        win = vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width = W,
          height = H,
          row = math.floor((vim.o.lines - H) / 2),
          col = math.floor((vim.o.columns - W) / 2),
          style = "minimal",
          border = "rounded",
          title = " Markdown Preview ",
          title_pos = "center",
        })
        glow_w = W - 2
      else -- "split"
        vim.cmd "rightbelow vsplit"
        win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(win, buf)
        local W = math.floor(vim.o.columns * 0.5)
        vim.api.nvim_win_set_width(win, W)
        glow_w = W - 4
      end

      state.win, state.buf = win, buf

      -- Run glow inside `buf` without stealing focus into terminal-insert mode.
      vim.api.nvim_buf_call(buf, function()
        vim.fn.jobstart({ "glow", "-s", "dark", "-w", tostring(glow_w), tmp }, {
          term = true,
          on_exit = function()
            vim.fn.delete(tmp)
            if state.win and vim.api.nvim_win_is_valid(state.win) then
              pcall(vim.api.nvim_win_set_cursor, state.win, { 1, 0 })
            end
          end,
        })
      end)

      -- Close mappings, active in both normal and terminal modes.
      local opts = { buffer = buf, nowait = true, silent = true }
      vim.keymap.set({ "n", "t" }, "q", close_preview, opts)
      vim.keymap.set({ "n", "t" }, "<Esc>", close_preview, opts)
    end

    local function toggle(mode)
      if state.win and vim.api.nvim_win_is_valid(state.win) then
        close_preview()
      else
        open_preview(mode)
      end
    end

    _G.GlowPreview = { toggle = toggle, close = close_preview }

    -- Convenience commands mirroring the keymaps.
    vim.api.nvim_create_user_command("MarkdownPreview", function() toggle "float" end, {})
    vim.api.nvim_create_user_command("MarkdownPreviewSplit", function() toggle "split" end, {})
  end,
}
