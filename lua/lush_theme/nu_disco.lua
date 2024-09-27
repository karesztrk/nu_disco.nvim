--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local white = hsl('#FFFFFF')

local grey_100 = hsl('#0C001F')
local grey_90 = hsl('#180D2A')
local grey_80 = hsl '#231934'
local grey_60 = hsl('#322941')
local grey_40 = hsl('#4E465B')
local grey_30 = hsl('#BDB7BD')
local grey_20 = hsl('#E7E4E7')
local grey_10 = hsl('#ECE9EC')
local grey_5 = hsl('#F8F7F8')

local red_darker = hsl('#BD0000')
local red_dark = hsl('#E62424')
local red_light = hsl('#FF7878')
local red_lighter = hsl('#FFB8B8')

local orange_darker = hsl('#D16100')
local orange_dark = hsl('#F27C18')
local orange_light = hsl('#FFB271')
local orange_lighter = hsl('#FFDDC0')

local yellow_darker = hsl('#D0BF00')
local yellow_dark = hsl('#EEDA00')
local yellow_light = hsl('#FFF373')
local yellow_lighter = hsl('#FFF9BB')

local lime_darker = hsl('#669900')
local lime_dark = hsl('#7EBD00')
local lime_light = hsl('#CBF37C')
local lime_lighter = hsl('#E8FFBA')

local green_darker = hsl('#009E35')
local green_dark = hsl('#06B741')
local green_light = hsl('#67E591')
local green_lighter = hsl('#AEECC3')

local teal_darker = hsl('#00837F')
local teal_dark = hsl('#0CABA6')
local teal_light = hsl('#52E7E1')
local teal_lighter = hsl('#C4FFFD')

local blue_darker = hsl('#005C8A')
local blue_dark = hsl('#0081C2')
local blue_light = hsl('#6BB5FF')
local blue_lighter = hsl('#C3E7F9')

local purple_darker = hsl('#280E54')
local purple_dark = hsl('#4B1E97')
local purple_light = hsl('#AD7DFF')
local purple_lighter = hsl('#D5BDFF')

local pink_darker = hsl('#B6034B')
local pink_dark = hsl('#E62472')
local pink_light = hsl('#FF82B4')
local pink_lighter = hsl('#FFCFE3')

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- Git diff
    DiffTextAdded { bg = green_light, fg = grey_90 },
    DiffTextDeleted { bg = red_light, fg = grey_90 },
    DiffTextChanged { bg = teal_light, fg = grey_90 },
    DiffLineAdded { bg = green_light, fg = grey_90 },
    DiffLineDeleted { bg = red_light, fg = grey_90 },
    DiffLineChanged { bg = teal_light, fg = grey_90 },

    GutterGitModified { fg = teal_light },
    GutterGitAdded { fg = green_light },
    GutterGitDeleted { fg = red_light },
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn { fg = white, bg = grey_100 }, -- Columns set with 'colorcolumn'
    Conceal { fg = grey_20 },                  -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = teal_light },                -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = grey_100 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { bg = grey_80 },   -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = grey_20 },     -- Directory names (and other special names in listings)
    DiffAdd { DiffLineAdded },      -- Diff mode: Added line |diff.txt|
    DiffChange { DiffLineChanged }, -- Diff mode: Changed line |diff.txt|
    DiffDelete { DiffLineDeleted }, -- Diff mode: Deleted line |diff.txt|
    DiffText { DiffTextChanged },   -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = grey_40 },   -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { fg = red_dark  }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg { bg = red_light, fg = grey_90 },                  -- Error messages on the command line
    VertSplit { fg = grey_40 },                               -- Column separating vertically split windows
    Folded { bg = blue_darker },                               -- Line used for closed folds
    FoldColumn { bg = blue_darker },                         -- 'foldcolumn'
    SignColumn { bg = grey_100 },                             -- Column where |signs| are displayed
    IncSearch { bg = grey_40 },                               -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr { fg = grey_40 },                                  -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = grey_20 },                            -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { bg = blue_darker, fg = purple_light, gui = "bold, underline" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg { fg = grey_5 },                                  -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = grey_5 },               -- |more-prompt|
    NonText { fg = grey_20 },              -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal { fg = grey_5, bg = grey_100 }, -- Normal text
    -- NormalFloat  { }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows/
    Pmenu { bg = grey_80 },                            -- Popup menu: Normal item.
    PmenuSel { fg = white, bg = blue_dark },           -- Popup menu: Selected item.
    PmenuSbar { bg = grey_90 },                        -- Popup menu: Scrollbar.
    PmenuThumb { bg = grey_40 },                       -- Popup menu: Thumb of the scrollbar.
    Question { fg = blue_light },                      -- |hit-enter| prompt and yes/no questions
    QuickFixLine { bg = grey_40, gui = 'bold' },       -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { bg = grey_40 },                           -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey { fg = grey_5 },                        -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad { gui = 'undercurl', sp = red_light },    -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap { gui = 'undercurl', sp = yellow_light }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal { gui = 'undercurl', sp = blue_light }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare { gui = 'undercurl', sp = blue_light },  -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine { bg = grey_60 },                       -- Status line of current window
    StatusLineNC { fg = grey_5, bg = grey_60 },        -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine { fg = grey_20, bg = grey_60 },            -- Tab pages line, not active tab page label
    TabLineFill { fg = 'NONE', bg = grey_60 },         -- Tab pages line, where there are no labels
    TabLineSel { fg = white, bg = grey_100 },          -- Tab pages line, active tab page label
    Title { fg = blue_light },           -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual { bg = grey_40 },                           -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = grey_60, bg = yellow_light },    -- Warning messages
    Whitespace { fg = grey_60 },                       -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu { PmenuSel },                             -- Current match in 'wildmenu' completion
    -- Winbar { fg = white, bg = grey_90 },
    -- WinbarNC { fg = grey_5, bg = grey_90 },

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { fg = grey_30 },          -- Any comment

    Constant { fg = teal_light },      -- (*) Any constant
    String { fg = green_light },       --   A string constant: "this is a string"
    Character { String },              --   A character constant: 'c', '\n'
    Number { fg = red_light },         --   A number constant: 234, 0xff
    Boolean { Number },                --   A boolean constant: TRUE, false
    Float { Number },                  --   A floating point constant: 2.3e10

    Identifier { fg = teal_light },    -- (*) Any variable name
    Function { fg = blue_light },      --   Function name (also: methods for classes)

    Statement { fg = purple_lighter }, -- (*) Any statement
    Conditional { Statement },         --   if, then, else, endif, switch, etc.
    Repeat { Statement },              --   for, do, while, etc.
    Label { Statement },               --   case, default, etc.
    Operator { Statement },            --   "sizeof", "+", "*", etc.
    Keyword { Statement },             --   any other keyword
    Exception { Statement },           --   try, catch, throw

    PreProc { fg = purple_light },     -- (*) Generic Preprocessor
    Include { fg = purple_lighter },   --   Preprocessor #include
    Define { PreProc },                --   Preprocessor #define
    Macro { PreProc },                 --   Same as Define
    PreCondit { PreProc },             --   Preprocessor #if, #else, #endif, etc.

    Type { fg = grey_5 },              -- (*) int, long, char, etc.
    StorageClass { Type },             --   static, register, volatile, etc.
    Structure { Type },                --   struct, union, enum, etc.
    Typedef { Type },                  --   A typedef

    Special        { fg = red_light }, -- (*) Any special symbol
    --SpecialChar    { Special }, --   Special character in a constant
    Tag { fg = orange_light },     --   You can use CTRL-] on this
    Delimiter { fg = pink_light }, --   Character that needs attention
    --SpecialComment { Special }, --   Special things inside a comment (e.g. '\n')
    Debug { fg = red_dark },       --   Debugging statements

    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { fg = red_light },                             -- Any erroneous construct
    Todo { fg = grey_5, bg = orange_dark, gui = 'bold' }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { bg = teal_darker, fg = white }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
    LspInlayHint { bg= grey_80, fg = grey_30, }, -- Highlight for inlay hints served by the LSP: type information, param name, etc.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { fg = red_light },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { fg = orange_light }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = teal_light },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = orange_light },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = 'undercurl', sp = red_light } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = 'undercurl', sp = orange_light  } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = 'undercurl', sp = teal_light } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = 'undercurl', sp = orange_light} , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    DiagnosticUnnecessary { fg = teal_darker },

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { fg = grey_40 }, -- Comment
    sym "@punctuation" { fg = grey_20 },              -- Delimiter
    -- sym "@punctuation.bracket" { fg = orange_lighter }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { fg = red_dark }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    sym"@boolean"           { fg = green_light }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    sym "@property" { fg = teal_light },       -- Identifier
    sym "@constructor" { fg = purple_lighter }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    --sym"@keyword"           { }, -- Keyword
    sym "@keyword.operator" { fg = purple_lighter }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym "@variable" { fg = teal_light },      -- Identifier
    sym "@variable.builtin" { fg = yellow_lighter },      -- Identifier
    sym "@type" { fg = teal_light },          -- Type
    -- sym"@type.builtin"      { fg = yellow_light }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    sym "@include" { fg = purple_lighter, gui = "italic" }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    
    -- tsx
    sym "@tag" { fg = blue_light },           -- Tag
    sym "@tag.delimiter" { fg = grey_10 },    -- Tag delimiter
    sym "@tag.attribute" { fg = blue_light }, -- Tag attribute
    sym "@tag.tsx" { fg = orange_light },
    sym "@constant.builtin.tsx" { fg = purple_lighter },
    sym "@tag.delimiter.tsx" { fg = pink_lighter },
    sym "@tag.builtin.tsx" { fg = red_light },
    sym "@keyword.conditional.ternary.tsx" { fg = grey_10 },
    sym "@lsp.type.interface.typescriptreact" { fg = yellow_light },
    sym "@lsp.mod.declaration.typescriptreact" { fg = teal_light },

    -- ts
    sym "@type.typescript" { fg = teal_light },
    sym "@type.builtin.typescript" { fg = purple_lighter },
    sym "@lsp.type.class.typescript" { fg = orange_light },
    sym "@lsp.type.interface.typescript" { fg = purple_lighter },
    sym "@constant.builtin.typescript" { fg = purple_lighter },
    sym "@lsp.typemod.property.declaration.typescript" { fg = pink_light },

    -- js
    sym "@lsp.typemod.property.declaration.javascript" { fg = pink_light },
    sym "@lsp.mod.readonly.javascript" { fg = teal_light },
    sym "@lsp.mod.defaultLibrary.javascript" { fg = teal_light },

    -- css
    sym "@tag.css" { fg = red_light },
    sym "@type.css" { fg = yellow_light },
    sym "@attribute.css" { fg = green_lighter },
    sym "@tag.attribute.css" { fg = green_lighter },
    sym "@number.css" { fg = pink_light },
    sym "@number.float.css" { fg = pink_light },
    sym "@string.css" { fg = pink_light },
    sym "@property.css" { fg = grey_10 },
 
    -- scss
    sym "@tag.scss" { fg = red_light },
    sym "@type.scss" { fg = yellow_light },
    sym "@attribute.scss" { fg = green_lighter },
    sym "@tag.attribute.scss" { fg = green_lighter },
    sym "@number.scss" { fg = pink_light },
    sym "@number.float.scss" { fg = pink_light },
    sym "@string.scss" { fg = pink_light },
    sym "@property.scss" { fg = grey_10 },
    sym "@constant.scss" { fg = orange_light },

    -- astro
    sym "@tag.astro" { fg = red_light },
    sym "@punctuation.special.astro" { fg = grey_10 },

    --md
    sym "@nospell.markdown_inline" { fg = teal_light },
    RenderMarkdownH1Bg { fg = teal_light },
    RenderMarkdownH2Bg { fg = green_light },
    RenderMarkdownH3Bg { fg = lime_light },
    RenderMarkdownH4Bg { fg = orange_light },
    RenderMarkdownH5Bg { fg = pink_light },
    RenderMarkdownH6Bg { fg = red_light },

    -- yaml
    sym "@property.yaml" { fg = orange_light },
    sym "@type.yaml" { fg = purple_lighter },

    -- Telescope
    TelescopeBorder { fg = pink_light },
    TelescopePromptBorder { TelescopeBorder },
    TelescopeResultsBorder { TelescopePromptBorder },
    TelescopePreviewBorder { TelescopePromptBorder },
    -- TelescopeSelection { fg = green_light },
    TelescopeMatching { fg = grey_5, bg = teal_darker },
    -- TelescopeNormal { fg = blue_light },
    -- TelescopePromptPrefix { fg = green_light },

    -- indent-blankline
    IndentBlanklineChar { fg = grey_80 },
    IndentBlanklineSpaceChar { IndentBlanklineChar },
    IndentBlanklineSpaceCharBlankline { IndentBlanklineChar },
    -- IndentBlanklineContextChar { fg = indent_guide_context_fg },
    -- IndentBlanklineContextSpaceChar { IndentBlanklineContextChar },
    -- IndentBlanklineContextStart { gui = 'underline', sp = indent_guide_context_fg },

    -- nvim-cmp
    CmpItemAbbrDeprecated { fg = grey_20, bg = 'NONE', gui = 'strikethrough' },
    CmpItemAbbrMatch { fg = blue_light, bg = 'NONE' },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },

    SuggestWidgetBorder { fg = grey_20 },
    SuggestWidgetSelect { bg = purple_darker },

    CmpItemKindText { fg = grey_20, bg = 'NONE' },
    CmpItemKindMethod { fg = pink_light, bg = 'NONE' },
    CmpItemKindFunction { CmpItemKindMethod },
    CmpItemKindConstructor { CmpItemKindFunction },
    CmpItemKindField { fg = blue_light, bg = 'NONE' },
    CmpItemKindVariable { CmpItemKindField },
    CmpItemKindClass { fg = orange_light, bg = 'NONE' },
    CmpItemKindInterface { CmpItemKindField },
    CmpItemKindModule { CmpItemKindText },
    CmpItemKindProperty { CmpItemKindText },
    CmpItemKindUnit { CmpItemKindText },
    CmpItemKindValue { CmpItemKindText },
    CmpItemKindEnum { CmpItemKindClass },
    CmpItemKindKeyword { CmpItemKindText },
    CmpItemKindSnippet { CmpItemKindText },
    CmpItemKindColor { CmpItemKindText },
    CmpItemKindFile { CmpItemKindText },
    CmpItemKindReference { CmpItemKindText },
    CmpItemKindFolder { CmpItemKindText },
    CmpItemKindEnumMember { CmpItemKindField },
    CmpItemKindConstant { CmpItemKindText },
    CmpItemKindStruct { CmpItemKindText },
    CmpItemKindEvent { CmpItemKindClass },
    CmpItemKindOperator { CmpItemKindText },
    CmpItemKindTypeParameter { CmpItemKindText },

    -- Gitsigns
    GitSignsAdd { GutterGitAdded },
    GitSignsChange { GutterGitModified },
    GitSignsDelete { GutterGitDeleted },
    GitSignsAddNr { GitSignsAdd },
    GitSignsChangeNr { GitSignsChange },
    GitSignsDeleteNr { GitSignsDelete },
    GitSignsAddLn { DiffAdd },
    GitSignsChangeLn { DiffChange },
    GitSignsDeleteLn { DiffDelete },
    GitSignsAddInline { DiffTextAdded },
    GitSignsChangeInline { DiffTextChanged },
    GitSignsDeleteInline { DiffTextDeleted },

    -- nvim-tree
    NvimTreeSymlink { fg = red_dark },
    NvimTreeRootFolder { fg = grey_20, bold = true },
    NvimTreeFolderIcon { fg = blue_dark, bold = true },
    NvimTreeFileIcon { fg = blue_dark },
    NvimTreeExecFile { fg = green_light, bold = true },
    NvimTreeOpenedFile { fg = red_light, bold = true },
    NvimTreeSpecialFile { fg = grey_5, bold = true, underline = true },
    NvimTreeImageFile { fg = purple_lighter },
    NvimTreeIndentMarker { fg = grey_40 },
    NvimTreeGitDirty { fg = teal_light },
    NvimTreeGitStaged { fg = orange_light },
    -- NvimTreeGitMerge { fg = palette.neutral_purple },
    -- NvimTreeGitRenamed { fg = palette.neutral_purple },
    NvimTreeGitNew { fg = green_light },
    NvimTreeGitDeleted { fg = red_light },
    NvimTreeWindowPicker { bg = blue_darker },
    NvimTreeFolderName { fg = grey_20 },
    NvimTreeOpenedFolderName { NvimTreeFolderName },
    -- NvimTreeFileDirty {}
    -- NvimTreeFileStaged {}
    -- NvimTreeFileMerge {}
    -- NvimTreeFileRenamed {}
    -- NvimTreeFileNew {}
    -- NvimTreeFileDeleted {}
    -- NvimTreeFileIgnored {}
    NvimTreeCursorLine { bg = grey_60 },

    -- Notify
    NotifyBackground { bg = grey_100 },
    NotifyERRORBorder { fg = pink_dark },
    NotifyWARNBorder { fg = orange_dark },
    NotifyINFOBorder { fg = blue_dark },
    NotifyDEBUGBorder { fg = grey_20 },
    NotifyTRACEBorder { fg = purple_light },
    NotifyERRORIcon { fg = pink_dark },
    NotifyWARNIcon { fg = orange_dark },
    NotifyINFOIcon { fg = blue_dark },
    NotifyDEBUGIcon { fg = grey_20 },
    NotifyTRACEIcon { fg = purple_light },
    NotifyERRORTitle { fg = pink_dark },
    NotifyWARNTitle { fg = orange_dark },
    NotifyINFOTitle { fg = blue_dark },
    NotifyDEBUGTitle { fg = grey_20 },
    NotifyTRACETitle { fg = purple_light },

    -- Dashboard
    DashboardHeader { fg = teal_light },
    DashboardFooter { fg = grey_30 },
    DashboardDesc { fg = teal_light },
    DashboardKey { fg = green_light },
    DashboardIcon { fg = teal_lighter },
    DashboardShortCut { fg = blue_light },

    -- LazyGit
    FloatBorder { fg = grey_30 }
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
