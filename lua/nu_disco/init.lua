local Util = require("nu_disco.util")

local M = {}

-- Color definitions
local colors = {
	white = "#FFFFFF",

	grey_100 = "#0C001F",
	grey_90 = "#180D2A",
	grey_80 = "#231934",
	grey_60 = "#322941",
	grey_40 = "#4E465B",
	grey_30 = "#BDB7BD",
	grey_20 = "#E7E4E7",
	grey_10 = "#ECE9EC",
	grey_5 = "#F8F7F8",

	red_darker = "#BD0000",
	red_dark = "#E62424",
	red_light = "#FF7878",
	red_lighter = "#FFB8B8",

	orange_darker = "#D16100",
	orange_dark = "#F27C18",
	orange_light = "#FFB271",
	orange_lighter = "#FFDDC0",

	yellow_darker = "#D0BF00",
	yellow_dark = "#EEDA00",
	yellow_light = "#FFF373",
	yellow_lighter = "#FFF9BB",

	lime_darker = "#669900",
	lime_dark = "#7EBD00",
	lime_light = "#CBF37C",
	lime_lighter = "#E8FFBA",

	green_darker = "#009E35",
	green_dark = "#06B741",
	green_light = "#67E591",
	green_lighter = "#AEECC3",

	teal_darker = "#00837F",
	teal_dark = "#0CABA6",
	teal_light = "#52E7E1",
	teal_lighter = "#C4FFFD",

	blue_darker = "#005C8A",
	blue_dark = "#0081C2",
	blue_light = "#6BB5FF",
	blue_lighter = "#C3E7F9",

	purple_darker = "#280E54",
	purple_dark = "#4B1E97",
	purple_light = "#AD7DFF",
	purple_lighter = "#D5BDFF",

	pink_darker = "#B6034B",
	pink_dark = "#E62472",
	pink_light = "#FF82B4",
	pink_lighter = "#FFCFE3",
}

function M.setup()
	-- Reset highlighting
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "nu_disco"

	local hi = function(name, opts)
		vim.api.nvim_set_hl(0, name, opts)
	end

	-- Git diff
	hi("DiffTextAdded", { bg = colors.green_light, fg = colors.grey_90 })
	hi("DiffTextDeleted", { bg = colors.red_light, fg = colors.grey_90 })
	hi("DiffTextChanged", { bg = colors.teal_light, fg = colors.grey_90 })
	hi("DiffLineAdded", { bg = colors.green_light, fg = colors.grey_90 })
	hi("DiffLineDeleted", { bg = colors.red_light, fg = colors.grey_90 })
	hi("DiffLineChanged", { bg = colors.teal_light, fg = colors.grey_90 })

	hi("GutterGitModified", { fg = colors.teal_light })
	hi("GutterGitAdded", { fg = colors.green_light })
	hi("GutterGitDeleted", { fg = colors.red_light })

	-- Neovim highlight groups
	hi("ColorColumn", { bg = colors.grey_90 })
	hi("Conceal", { fg = colors.grey_20 })
	hi("Cursor", { fg = colors.teal_light })
	hi("CursorColumn", { bg = colors.grey_100 })
	hi("CursorLine", { bg = colors.grey_80 })
	hi("Directory", { fg = colors.grey_20 })
	hi("DiffAdd", { link = "DiffLineAdded" })
	hi("DiffChange", { link = "DiffLineChanged" })
	hi("DiffDelete", { link = "DiffLineDeleted" })
	hi("DiffText", { link = "DiffTextChanged" })
	hi("EndOfBuffer", { fg = colors.grey_40 })
	hi("ErrorMsg", { bg = colors.red_light, fg = colors.grey_90 })
	hi("VertSplit", { fg = colors.grey_40 })
	hi("Folded", { bg = colors.blue_darker })
	hi("FoldColumn", { bg = colors.blue_darker })
	hi("SignColumn", { bg = colors.grey_100 })
	hi("IncSearch", { bg = colors.grey_40 })
	hi("LineNr", { fg = colors.grey_40 })
	hi("CursorLineNr", { fg = colors.grey_20 })
	hi("MatchParen", { bg = colors.blue_darker, fg = colors.purple_light, bold = true, underline = true })
	hi("ModeMsg", { fg = colors.grey_5 })
	hi("MoreMsg", { fg = colors.grey_5 })
	hi("NonText", { fg = colors.grey_20 })
	hi("Normal", { fg = colors.grey_5, bg = colors.grey_100 })
	hi("Pmenu", { bg = colors.grey_80 })
	hi("PmenuSel", { fg = colors.white, bg = colors.blue_dark })
	hi("PmenuSbar", { bg = colors.grey_90 })
	hi("PmenuThumb", { bg = colors.grey_40 })
	hi("Question", { fg = colors.blue_light })
	hi("QuickFixLine", { bg = colors.grey_40, bold = true })
	hi("Search", { bg = colors.grey_40 })
	hi("SpecialKey", { fg = colors.grey_5 })
	hi("SpellBad", { undercurl = true, sp = colors.red_light })
	hi("SpellCap", { undercurl = true, sp = colors.yellow_light })
	hi("SpellLocal", { undercurl = true, sp = colors.blue_light })
	hi("SpellRare", { undercurl = true, sp = colors.blue_light })
	hi("StatusLine", { bg = colors.grey_60 })
	hi("StatusLineNC", { fg = colors.grey_5, bg = colors.grey_60 })
	hi("TabLine", { fg = colors.grey_20, bg = colors.grey_60 })
	hi("TabLineFill", { bg = colors.grey_60 })
	hi("TabLineSel", { fg = colors.white, bg = colors.grey_100 })
	hi("Title", { fg = colors.blue_light })
	hi("WarningMsg", { fg = colors.grey_60, bg = colors.yellow_light })
	hi("Whitespace", { fg = colors.grey_60 })
	hi("WildMenu", { link = "PmenuSel" })

	-- Common vim syntax groups
	hi("Comment", { fg = colors.grey_20 })

	hi("Constant", { fg = colors.teal_light })
	hi("String", { fg = colors.green_light })
	hi("Character", { link = "String" })
	hi("Number", { fg = colors.red_light })
	hi("Boolean", { link = "Number" })
	hi("Float", { link = "Number" })

	hi("Identifier", { fg = colors.teal_light })
	hi("Function", { fg = colors.blue_light })

	hi("Statement", { fg = colors.purple_lighter })
	hi("Conditional", { link = "Statement" })
	hi("Repeat", { link = "Statement" })
	hi("Label", { link = "Statement" })
	hi("Operator", { link = "Statement" })
	hi("Keyword", { link = "Statement" })
	hi("Exception", { link = "Statement" })

	hi("PreProc", { fg = colors.purple_light })
	hi("Include", { fg = colors.purple_lighter })
	hi("Define", { link = "PreProc" })
	hi("Macro", { link = "PreProc" })
	hi("PreCondit", { link = "PreProc" })

	hi("Type", { fg = colors.grey_5 })
	hi("StorageClass", { link = "Type" })
	hi("Structure", { link = "Type" })
	hi("Typedef", { link = "Type" })

	hi("Special", { fg = colors.red_light })
	hi("Tag", { fg = colors.orange_light })
	hi("Delimiter", { fg = colors.pink_light })
	hi("Debug", { fg = colors.red_dark })

	hi("Error", { fg = colors.red_light })
	hi("Todo", { fg = colors.grey_5, bg = colors.orange_dark, bold = true })

	-- LSP
	hi("LspSignatureActiveParameter", { bg = colors.teal_darker, fg = colors.white })
	hi("LspInlayHint", { bg = colors.grey_80, fg = colors.grey_30 })

	-- Diagnostics
	hi("DiagnosticError", { fg = colors.red_light })
	hi("DiagnosticWarn", { fg = colors.orange_light })
	hi("DiagnosticInfo", { fg = colors.teal_light })
	hi("DiagnosticHint", { fg = colors.orange_light })
	hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.red_light })
	hi("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.orange_light })
	hi("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.teal_light })
	hi("DiagnosticUnderlineHint", { undercurl = true, sp = colors.orange_light })
	hi("DiagnosticUnnecessary", { fg = colors.teal_darker })

	-- Tree-Sitter
	hi("@punctuation", { fg = colors.grey_20 })
	hi("@boolean", { fg = colors.green_light })
	hi("@property", { fg = colors.teal_light })
	hi("@constructor", { fg = colors.purple_lighter })
	hi("@keyword.operator", { fg = colors.purple_lighter })
	hi("@variable", { fg = colors.teal_light })
	hi("@variable.builtin", { fg = colors.yellow_lighter })
	hi("@type", { fg = colors.teal_light })
	hi("@include", { fg = colors.purple_lighter, italic = true })
	hi("@comment", { link = "Comment" })
	hi("@comment.documentation", { fg = colors.grey_30 })

	-- tsx
	hi("@tag", { fg = colors.blue_light })
	hi("@tag.delimiter", { fg = colors.grey_10 })
	hi("@tag.attribute", { fg = colors.blue_light })
	hi("@tag.tsx", { fg = colors.orange_light })
	hi("@constant.builtin.tsx", { fg = colors.purple_lighter })
	hi("@tag.delimiter.tsx", { fg = colors.pink_lighter })
	hi("@tag.builtin.tsx", { fg = colors.red_light })
	hi("@keyword.conditional.ternary.tsx", { fg = colors.grey_10 })
	hi("@lsp.type.interface.typescriptreact", { fg = colors.yellow_light })
	hi("@lsp.mod.declaration.typescriptreact", { fg = colors.teal_light })

	-- ts
	hi("@type.typescript", { fg = colors.teal_light })
	hi("@type.builtin.typescript", { fg = colors.purple_lighter })
	hi("@lsp.type.class.typescript", { fg = colors.orange_light })
	hi("@lsp.type.interface.typescript", { fg = colors.purple_lighter })
	hi("@constant.builtin.typescript", { fg = colors.purple_lighter })
	hi("@lsp.typemod.property.declaration.typescript", { fg = colors.pink_light })

	-- js
	hi("@lsp.typemod.property.declaration.javascript", { fg = colors.pink_light })
	hi("@lsp.mod.readonly.javascript", { fg = colors.teal_light })
	hi("@lsp.mod.defaultLibrary.javascript", { fg = colors.teal_light })

	-- css
	hi("@tag.css", { fg = colors.red_light })
	hi("@type.css", { fg = colors.yellow_light })
	hi("@attribute.css", { fg = colors.green_lighter })
	hi("@tag.attribute.css", { fg = colors.green_lighter })
	hi("@number.css", { fg = colors.pink_light })
	hi("@number.float.css", { fg = colors.pink_light })
	hi("@string.css", { fg = colors.pink_light })
	hi("@property.css", { fg = colors.grey_10 })

	-- scss
	hi("@tag.scss", { fg = colors.red_light })
	hi("@type.scss", { fg = colors.yellow_light })
	hi("@attribute.scss", { fg = colors.green_lighter })
	hi("@tag.attribute.scss", { fg = colors.green_lighter })
	hi("@number.scss", { fg = colors.pink_light })
	hi("@number.float.scss", { fg = colors.pink_light })
	hi("@string.scss", { fg = colors.pink_light })
	hi("@property.scss", { fg = colors.grey_10 })
	hi("@constant.scss", { fg = colors.orange_light })

	-- astro
	hi("@tag.astro", { fg = colors.red_light })
	hi("@punctuation.special.astro", { fg = colors.grey_10 })

	-- md
	hi("@nospell.markdown_inline", { fg = colors.teal_light })

	local rainbow = {
		colors.teal_light,
		colors.green_light,
		colors.lime_light,
		colors.orange_light,
		colors.pink_light,
		colors.red_light,
	}

	for i, color in ipairs(rainbow) do
		hi("RenderMarkdownH" .. i, { fg = color })
		hi("RenderMarkdownH" .. i .. "Bg", { bg = Util.blend_bg(color, 0.15, colors.grey_100) })
		hi("@markup.heading." .. i .. ".markdown", { fg = color })
	end

	hi("@markup.list.checked", { fg = colors.teal_light })
	hi("@markup.list.unchecked", { fg = colors.blue_light })

	hi("@markup.raw.markdown_inline", { fg = colors.blue_light, bg = colors.grey_80 })
	hi("RenderMarkdownCodeInline", { link = "@markup.raw.markdown_inline" })
	hi("RenderMarkdownCode", { bg = colors.grey_80 })

	-- yaml
	hi("@property.yaml", { fg = colors.orange_light })
	hi("@type.yaml", { fg = colors.purple_lighter })

	-- Telescope
	hi("TelescopeBorder", { fg = colors.pink_light })
	hi("TelescopePromptBorder", { link = "TelescopeBorder" })
	hi("TelescopeResultsBorder", { link = "TelescopePromptBorder" })
	hi("TelescopePreviewBorder", { link = "TelescopePromptBorder" })
	hi("TelescopeMatching", { fg = colors.grey_5, bg = colors.teal_darker })

	-- indent-blankline
	hi("IndentBlanklineChar", { fg = colors.grey_80 })
	hi("IndentBlanklineSpaceChar", { link = "IndentBlanklineChar" })
	hi("IndentBlanklineSpaceCharBlankline", { link = "IndentBlanklineChar" })

	-- nvim-cmp
	hi("CmpItemAbbrDeprecated", { fg = colors.grey_20, strikethrough = true })
	hi("CmpItemAbbrMatch", { fg = colors.blue_light })
	hi("CmpItemAbbrMatchFuzzy", { link = "CmpItemAbbrMatch" })

	hi("SuggestWidgetBorder", { fg = colors.grey_20 })
	hi("SuggestWidgetSelect", { bg = colors.purple_darker })

	hi("CmpItemKindText", { fg = colors.grey_20 })
	hi("CmpItemKindMethod", { fg = colors.pink_light })
	hi("CmpItemKindFunction", { link = "CmpItemKindMethod" })
	hi("CmpItemKindConstructor", { link = "CmpItemKindFunction" })
	hi("CmpItemKindField", { fg = colors.blue_light })
	hi("CmpItemKindVariable", { link = "CmpItemKindField" })
	hi("CmpItemKindClass", { fg = colors.orange_light })
	hi("CmpItemKindInterface", { link = "CmpItemKindField" })
	hi("CmpItemKindModule", { link = "CmpItemKindText" })
	hi("CmpItemKindProperty", { link = "CmpItemKindText" })
	hi("CmpItemKindUnit", { link = "CmpItemKindText" })
	hi("CmpItemKindValue", { link = "CmpItemKindText" })
	hi("CmpItemKindEnum", { link = "CmpItemKindClass" })
	hi("CmpItemKindKeyword", { link = "CmpItemKindText" })
	hi("CmpItemKindSnippet", { link = "CmpItemKindText" })
	hi("CmpItemKindColor", { link = "CmpItemKindText" })
	hi("CmpItemKindFile", { link = "CmpItemKindText" })
	hi("CmpItemKindReference", { link = "CmpItemKindText" })
	hi("CmpItemKindFolder", { link = "CmpItemKindText" })
	hi("CmpItemKindEnumMember", { link = "CmpItemKindField" })
	hi("CmpItemKindConstant", { link = "CmpItemKindText" })
	hi("CmpItemKindStruct", { link = "CmpItemKindText" })
	hi("CmpItemKindEvent", { link = "CmpItemKindClass" })
	hi("CmpItemKindOperator", { link = "CmpItemKindText" })
	hi("CmpItemKindTypeParameter", { link = "CmpItemKindText" })

	-- Gitsigns
	hi("GitSignsAdd", { link = "GutterGitAdded" })
	hi("GitSignsChange", { link = "GutterGitModified" })
	hi("GitSignsDelete", { link = "GutterGitDeleted" })
	hi("GitSignsAddNr", { link = "GitSignsAdd" })
	hi("GitSignsChangeNr", { link = "GitSignsChange" })
	hi("GitSignsDeleteNr", { link = "GitSignsDelete" })
	hi("GitSignsAddLn", { link = "DiffAdd" })
	hi("GitSignsChangeLn", { link = "DiffChange" })
	hi("GitSignsDeleteLn", { link = "DiffDelete" })
	hi("GitSignsAddInline", { link = "DiffTextAdded" })
	hi("GitSignsChangeInline", { link = "DiffTextChanged" })
	hi("GitSignsDeleteInline", { link = "DiffTextDeleted" })

	-- nvim-tree
	hi("NvimTreeSymlink", { fg = colors.red_dark })
	hi("NvimTreeRootFolder", { fg = colors.grey_20, bold = true })
	hi("NvimTreeFolderIcon", { fg = colors.blue_dark, bold = true })
	hi("NvimTreeFileIcon", { fg = colors.blue_dark })
	hi("NvimTreeExecFile", { fg = colors.green_light, bold = true })
	hi("NvimTreeOpenedFile", { fg = colors.red_light, bold = true })
	hi("NvimTreeSpecialFile", { fg = colors.grey_5, bold = true, underline = true })
	hi("NvimTreeImageFile", { fg = colors.purple_lighter })
	hi("NvimTreeIndentMarker", { fg = colors.grey_40 })
	hi("NvimTreeGitDirty", { fg = colors.teal_light })
	hi("NvimTreeGitStaged", { fg = colors.orange_light })
	hi("NvimTreeGitNew", { fg = colors.green_light })
	hi("NvimTreeGitDeleted", { fg = colors.red_light })
	hi("NvimTreeWindowPicker", { bg = colors.blue_darker })
	hi("NvimTreeFolderName", { fg = colors.grey_20 })
	hi("NvimTreeOpenedFolderName", { link = "NvimTreeFolderName" })
	hi("NvimTreeCursorLine", { bg = colors.grey_60 })

	-- Notify
	hi("NotifyBackground", { bg = colors.grey_100 })
	hi("NotifyERRORBorder", { fg = colors.pink_dark })
	hi("NotifyWARNBorder", { fg = colors.orange_dark })
	hi("NotifyINFOBorder", { fg = colors.blue_dark })
	hi("NotifyDEBUGBorder", { fg = colors.grey_20 })
	hi("NotifyTRACEBorder", { fg = colors.purple_light })
	hi("NotifyERRORIcon", { fg = colors.pink_dark })
	hi("NotifyWARNIcon", { fg = colors.orange_dark })
	hi("NotifyINFOIcon", { fg = colors.blue_dark })
	hi("NotifyDEBUGIcon", { fg = colors.grey_20 })
	hi("NotifyTRACEIcon", { fg = colors.purple_light })
	hi("NotifyERRORTitle", { fg = colors.pink_dark })
	hi("NotifyWARNTitle", { fg = colors.orange_dark })
	hi("NotifyINFOTitle", { fg = colors.blue_dark })
	hi("NotifyDEBUGTitle", { fg = colors.grey_20 })
	hi("NotifyTRACETitle", { fg = colors.purple_light })

	-- Dashboard
	hi("DashboardHeader", { fg = colors.teal_light })
	hi("DashboardFooter", { fg = colors.grey_30 })
	hi("DashboardDesc", { fg = colors.teal_light })
	hi("DashboardKey", { fg = colors.green_light })
	hi("DashboardIcon", { fg = colors.teal_lighter })
	hi("DashboardShortCut", { fg = colors.blue_light })

	-- Snacks dashboard
	hi("SnacksDashboardNormal", { fg = colors.teal_light })
	hi("SnacksDashboardDesc", { fg = colors.grey_20 })
	hi("SnacksDashboardFile", { fg = colors.grey_30 })
	hi("SnacksDashboardDir", { fg = colors.grey_30 })
	hi("SnacksDashboardFooter", { fg = colors.grey_30 })
	hi("SnacksDashboardHeader", { fg = colors.teal_light })
	hi("SnacksDashboardIcon", { fg = colors.teal_lighter })
	hi("SnacksDashboardKey", { fg = colors.green_light })
	hi("SnacksDashboardSpecial", { fg = colors.pink_light })
	hi("SnacksDashboardTitle", { fg = colors.teal_light })

	-- LazyGit
	hi("FloatBorder", { fg = colors.grey_30 })

	-- Snacks indent
	hi("SnacksIndent", { fg = colors.grey_60 })
	hi("SnacksIndentScope", { fg = colors.teal_darker })
	hi("SnacksIndent1", { fg = colors.red_darker })
	hi("SnacksIndent2", { fg = colors.red_dark })
	hi("SnacksIndent3", { fg = colors.red_light })
	hi("SnacksIndent4", { fg = colors.red_lighter })

	-- Snacks picker
	hi("SnacksPickerMatch", { fg = colors.teal_light })
	hi("SnacksPickerBorder", { fg = colors.grey_30 })
	hi("SnacksPickerDir", { fg = colors.teal_darker })
	hi("SnacksPickerPrompt", { fg = colors.pink_dark })
	hi("SnacksPickerInputBorder", { fg = colors.teal_light })

	-- Fzf
	hi("FzfLuaBorder", { fg = colors.grey_30 })
	hi("FzfLuaCursor", { link = "IncSearch" })
	hi("FzfLuaDirPart", { fg = colors.teal_darker })
	hi("FzfLuaFilePart", { link = "Normal" })
	hi("FzfLuaFzfPointer", { fg = colors.pink_dark })
	hi("FzfLuaFzfSeparator", { fg = colors.teal_light })
	hi("FzfLuaHeaderBind", { fg = colors.pink_light })
	hi("FzfLuaHeaderText", { fg = colors.teal_dark })
	hi("FzfLuaPath", { link = "Directory" })
	hi("FzfLuaPreviewTitle", { link = "Title" })
	hi("FzfLuaTitle", { link = "Title" })
	hi("FzfLuaFzfMatch", { fg = colors.teal_light })
	hi("FzfLuaFzfInfo", { fg = colors.teal_lighter })

	-- Mini
	hi("MiniFilesTitleFocused", { fg = colors.teal_light })
	hi("MiniFilesBorderModified", { fg = colors.pink_light })

	-- Blink
	hi("BlinkCmpGhostText", { link = "Comment" })
	hi("BlinkCmpLabel", { fg = colors.grey_30 })
	hi("BlinkCmpLabelMatch", { underline = true })
	hi("BlinkCmpMenuIcon", { fg = colors.orange_light })
	hi("BlinkCmpLabelDeprecated", { fg = colors.grey_40, strikethrough = true })
	hi("BlinkCmpMenuBorder", { fg = colors.teal_darker })
	hi("BlinkCmpSignatureHelp", { fg = colors.purple_lighter })
	hi("BlinkCmpSignatureHelpBorder", { fg = colors.teal_darker })
	hi("BlinkCmpKind", { link = "Normal" })
	hi("BlinkCmpKindCodeium", { fg = colors.teal_light })
	hi("BlinkCmpKindSupermaven", { link = "BlinkCmpKindCodeium" })
	hi("BlinkCmpKindTabNine", { link = "BlinkCmpKindCodeium" })
	hi("BlinkCmpKindCopilot", { link = "BlinkCmpKindCodeium" })
	hi("BlinkCmpKindSnippet", { fg = colors.lime_light })
end

return M
