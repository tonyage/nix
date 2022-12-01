local dusk = {}

dusk.vivid = {
  -- convert to tables later instead of base16 shit can do something like
  -- better handles and groups gradients when themeing
  -- black = {
  --   0 = "#1a1a1a",
  --   10 = "#242424",
  --   20 = "#2e2e2e",
  --   etc...
  -- }

  black   = "#1a1a1a",
  red     = "#ef596f",
  green   = "#89ca78",
  green01 = "#7eca9c",
  yellow  = "#e6c07b",
  blue    = "#6bb9f9",
  magenta = "#dd5fde",
  cyan    = "#60c0cc",
  white   = "#b5bcc9",
  orange  = "#e99560",
  pink    = "#de8c92",

  grey00  = "#383838",
  grey01  = "#424242",

  base00 = "#1a1a1a",
  base01 = "#242424",
  base02 = "#2e2e2e",
  base03 = "#383838",
  base04 = "#abb2bf",
  base05 = "#b5bcc9",
  base06 = "#bfc6d3",
  base07 = "#c0d0dd",
  base08 = "#ef596f",
  base09 = "#ea9560",
  base0A = "#e6c07b",
  base0B = "#89ca78",
  base0C = "#60c0cc",
  base0D = "#6bb9f9",
  base0E = "#dd5fde",
  base0F = "#f44747",
}

vim.opt.bg = "dark"

return dusk
