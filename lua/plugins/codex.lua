return {
  "JanSmrcka/codex.nvim",
  config = function()
    require("codex").setup({
      -- your configuration here (optional)
      window = {
        split_ratio = 0.3,
        position = "vertical",
        enter_insert = true, -- Enter insert mode when opening
        start_in_normal_mode = false, -- Override enter_insert
        hide_numbers = true, -- Hide line numbers
        hide_signcolumn = true, -- Hide sign column
      },

      keymaps = {
        toggle = {
          normal = "<C-,>",
          terminal = "<C-,>",
          variants = {
            continue = "<leader>oc",
            resume = "<leader>or",
            verbose = "<leader>ov",
            exec = "<leader>ox",
          },
        },
        context = {
          send_buffer = "<leader>ob",
          send_selection = "<leader>os",
        },
      },
    })

    -- Hide the plugin's hardcoded <leader>c group (runs after plugin's own 100ms defer)
    vim.defer_fn(function()
      local ok, wk = pcall(require, "which-key")
      if ok then
        wk.add({
          { "<leader>c",  hidden = true },
          { "<leader>cc", hidden = true },
          { "<leader>cr", hidden = true },
          { "<leader>cv", hidden = true },
          { "<leader>cx", hidden = true },
          { "<leader>cb", hidden = true },
          { "<leader>cs", hidden = true },
        })
      end
    end, 200)

    require("which-key").add({
      { "<leader>o", group = "OpenAI Codex" },
      { "<leader>ob", desc = "Send buffer" },
      { "<leader>oc", desc = "Continue" },
      { "<leader>or", desc = "Resume" },
      { "<leader>os", desc = "Send selection" },
      { "<leader>ov", desc = "Verbose" },
      { "<leader>ox", desc = "Exec" },
    })

    vim.keymap.set("n", "<leader>op", function()
      local filepath = vim.api.nvim_buf_get_name(0)
      if filepath == "" then
        vim.notify("No file path for current buffer", vim.log.levels.WARN)
        return
      end

      local codex = require("codex")
      local terminal = require("codex.terminal")
      local function send_path_to_codex(retries)
        retries = retries or 0

        local state = codex.get_state()
        local instance_id = state.current_instance
        if not instance_id then
          vim.notify("No active Codex instance", vim.log.levels.WARN)
          return
        end

        local bufnr = state.instances[instance_id]
        if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
          if retries < 10 then
            vim.defer_fn(function()
              send_path_to_codex(retries + 1)
            end, 80)
            return
          end
          vim.notify("Codex terminal not available", vim.log.levels.WARN)
          return
        end

        local ok, job_id = pcall(vim.api.nvim_buf_get_var, bufnr, "terminal_job_id")
        if not ok or not job_id then
          if retries < 10 then
            vim.defer_fn(function()
              send_path_to_codex(retries + 1)
            end, 80)
            return
          end
          vim.notify("Codex terminal job not found", vim.log.levels.ERROR)
          return
        end

        vim.fn.chansend(job_id, vim.fs.normalize(filepath) .. "\n")
        vim.notify("File path sent to Codex", vim.log.levels.INFO)

        local win = terminal.find_window_for_buffer(bufnr)
        if win then
          vim.api.nvim_set_current_win(win)
        end
      end

      local state = codex.get_state()
      local instance_id = state.current_instance
      local bufnr = instance_id and state.instances[instance_id]
      local is_visible = bufnr and terminal.find_window_for_buffer(bufnr)
      if not is_visible then
        codex.toggle()
      end

      vim.defer_fn(function()
        send_path_to_codex(0)
      end, 100)
    end, { desc = "Send file path to Codex", silent = true })
  end,
}
