local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    -- json = { "prettier" },
    -- jsonc = { "prettier" },
    -- markdown = { "prettier" },

    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },

    -- sql = { "sql_formatter" },

    python = { "isort", "black" },
    go = { "gofumpt", "goimports", "golines" },
    rust = { "rustfmt" },
    solidity = { "forge_fmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
