local sep_style = vim.g.statusline_sep_style
local separators = require("ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local sep_r = separators["right"]

local modes = {
  ["n"]   = { "NORMAL",              "NormalMode"    },
  ["niI"] = { "NORMAL i",            "NormalMode"    },
  ["niR"] = { "NORMAL r",            "NormalMode"    },
  ["niV"] = { "NORMAL v",            "NormalMode"    },
  ["no"]  = { "N-PENDING",           "NormalMode"    },
  ["i"]   = { "INSERT",              "InsertMode"    },
  ["ic"]  = { "INSERT (completion)", "InsertMode"    },
  ["ix"]  = { "INSERT completion",   "InsertMode"    },
  ["t"]   = { "TERMINAL",            "TerminalMode"  },
  ["nt"]  = { "NTERMINAL",           "NTerminalMode" },
  ["v"]   = { "VISUAL",              "VisualMode"    },
  ["V"]   = { "V-LINE",              "VisualMode"    },
  ["Vs"]  = { "V-LINE (Ctrl O)",     "VisualMode"    },
  [""]  = { "V-BLOCK",             "VisualMode"    },
  ["R"]   = { "REPLACE",             "ReplaceMode"   },
  ["Rv"]  = { "V-REPLACE",           "ReplaceMode"   },
  ["s"]   = { "SELECT",              "SelectMode"    },
  ["S"]   = { "S-LINE",              "SelectMode"    },
  [""]  = { "S-BLOCK",             "SelectMode"    },
  ["c"]   = { "COMMAND",             "CommandMode"   },
  ["cv"]  = { "COMMAND",             "CommandMode"   },
  ["ce"]  = { "COMMAND",             "CommandMode"   },
  ["r"]   = { "PROMPT",              "ConfirmMode"   },
  ["rm"]  = { "MORE",                "ConfirmMode"   },
  ["r?"]  = { "CONFIRM",             "ConfirmMode"   },
  ["!"]   = { "SHELL",               "TerminalMode"  },
}

local M = {}

M.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1]
  local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. sep_r
  return current_mode .. mode_sep1 .. "%#buffer#" .. sep_r
end

M.fileInfo = function()
  local icon = "  "
  local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.expand "%:t"

  if filename ~= "Empty " then
    local  devicons = require("nvim-web-devicons")
    local ft_icon = devicons.get_icon(filename)
    icon = (ft_icon ~= nil and " " .. ft_icon) or ""
    filename = " " .. filename .. " "
  end
  return "%#file_info#" .. icon .. filename .. "%#file_sep#" .. sep_r
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict
  local branch = "%#git_branch#".. "   " .. git_status.head
  local added = (git_status.added and git_status.added ~= 0) and ("%#git_added#" .. "  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("%#git_changed#" .. "  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("%#git_removed#" .. "  " .. git_status.removed) or ""
  local sep = " " .. "%#git_sep#" .. sep_r
  return branch .. added .. changed .. removed .. sep
end

M.progress = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not lsp then
    return ""
  end

  local msg = lsp.message or ""
  local percentage = lsp.percentage or 0
  local title = lsp.title or ""
  local spinners = { "", "" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
  return ("%#lsp_progress#" .. content) or ""
end

M.diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local e = (errors and errors > 0) and ("%#lsp_error#" .. " " .. errors .. " ") or ""
  local w = (warnings and warnings > 0) and ("%#lsp_warning#" .. "  " .. warnings .. " ") or ""
  local h = (hints and hints > 0) and ("%#lsp_hints#" .. "ﯧ " .. hints .. " ") or ""
  local i = (info and info > 0) and ("%#lsp_info#" .. " " .. info .. " ") or ""

  return e .. w .. h .. i
end

M.status = function()
  local sep = "%#lsp_sep#" .. sep_l
  local icon = "%#lsp_icon#" .. "  "
  local text = "%#lsp_text#" .. " "
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return (vim.o.columns > 100 and sep .. icon .. text .. client.name .. " ")
      end
    end
  end
end

M.cwd = function()
  local icon = "%#cwd_icon#" .. " "
  local name = "%#cwd_text#" .. " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
  return (vim.o.columns > 85 and ("%#cwd_sep#" .. sep_l .. icon .. name)) or ""
end

M.position = function()
  local left_sep = "%#pos_sep#" .. sep_l .. "%#pos_icon#" .. " "

  local current_line = vim.fn.line "."
  local total_line = vim.fn.line "$"
  local text = math.modf((current_line / total_line) * 100) .. tostring "%%"

  text = (current_line == 1 and "Top") or text
  text = (current_line == total_line and "Bot") or text

  return left_sep .. "%#pos_text#" .. " " .. text .. " "
end

return M
