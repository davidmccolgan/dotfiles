return {
  "olimorris/codecompanion.nvim",
  lazy = false, -- important in LazyVim, avoids loading issues
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = { api_key = "ANTHROPIC_API_KEY" }, -- reads from env var
          schema = {
            model = { default = "claude-sonnet-4-20250514" },
          },
        })
      end,
    },
    strategies = {
      chat = { adapter = "anthropic" },
      inline = { adapter = "anthropic" },
    },
  },
  keys = {
    -- works in normal AND visual mode
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat", mode = { "n", "v" } },
    { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions", mode = { "n", "v" } },
    -- the key one: visual select → inline instruction
    { "<leader>ai", "<cmd>'<,'>CodeCompanion<cr>", desc = "AI Inline", mode = "v" },
    --{ "<leader>ai", "<cmd>'<,'>CodeCompanion<cr>", desc = "AI Inline", mode = "v" },
    -- { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline", mode = { "n", "v" } },
    -- add selection to existing chat buffer
    { "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to AI Chat", mode = "v" },
  },
}
