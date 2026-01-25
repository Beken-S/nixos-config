{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("catppuccin").setup({
      flavour = "latte",
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  '';
}
