--[[--
  Use this file to specify User preferences.
  Review [examples](+/Applications/ZeroBraneStudio.app/Contents/ZeroBraneStudio/cfg/user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--

editor.fontsize = 12 -- this is mapped to ide.config.editor.fontsize
editor.fontname = "Menlo"
filehistorylength = 200 -- this is mapped to ide.config.filehistorylength


-- to specify full path to moai *executable* if it's not in one of PATH folders
path.moai = '~/moai/moai-dev/bin/osx/moai'
-- Moai config.lua file is searched in the following places: (1) MOAI_CONFIG,
-- (2) project directory (if set) or folder with the current file,
-- (3) folder with the moai executable.


-- to fix an issue with 0d0d0a line endings in MOAI examples,
-- which may negatively affect breakpoints during debugging
editor.iofilter = "0d0d0aFix"

-- to have 4 spaces when TAB is used in the editor
editor.tabwidth = 4

-- to have TABs stored in the file (to allow mixing tabs and spaces)
editor.usetabs  = false

-- to disable wrapping of long lines in the editor
editor.usewrap = false

-- to turn dynamic words on and to start suggestions after 4 characters
acandtip.nodynwords = false
acandtip.startat = 2

-- to automatically open files requested during debugging
editor.autoactivate = true

-- to specify a list of MOAI entrypoints
moai = { entrypoints = { "main.lua", "source/main.lua" } }

-- to specify language to use in the IDE (requires a file in cfg/i18n folder)
language = "en"

-- to change the default color scheme; check tomorrow.lua for the list
-- of supported schemes or use cfg/scheme-picker.lua to pick a scheme.
local G = ...
styles = G.loadfile('cfg/tomorrow.lua')('Monokai')
-- also apply the same scheme to Output and Console windows
stylesoutshell = styles

-- to change markers used in console and output windows
styles.marker = styles.marker or {}
styles.marker.message = {ch = wxstc.wxSTC_MARK_ARROWS, {0, 0, 0}, {240, 240, 240}}
styles.marker.output = {ch = wxstc.wxSTC_MARK_BACKGROUND, {0, 0, 0}, {240, 240, 240}}
styles.marker.prompt = {ch = wxstc.wxSTC_MARK_CHARACTER+('>'):byte(), {0, 0, 0}, {240, 240, 240}}
stylesoutshell = styles

  --[[ other possible values are:
    wxSTC_INDIC_PLAIN	 Single-line underline
    wxSTC_INDIC_SQUIGGLE Squiggly underline
    wxSTC_INDIC_TT	 Line of small T-shapes
    wxSTC_INDIC_DIAGONAL Diagonal hatching
    wxSTC_INDIC_STRIKE	 Strike-out
    wxSTC_INDIC_BOX      Box
    wxSTC_INDIC_ROUNDBOX Rounded Box
  --]]
styles.indicator.fncall.over = wxstc.wxSTC_LUA_WORD6
styles.indicator.varlocal.over = wxstc.wxSTC_LUA_WORD8
styles.indicator.varglobal = nil
styles.indicator.varmasking.st = wxstc.wxSTC_INDIC_DIAGONAL
styles.indicator.varmasked.st = wxstc.wxSTC_INDIC_STRIKE

keymap[G.ID_COMMENT] = "Ctrl-/"

-- to force execution to continue immediately after starting debugging;
-- set to `false` to disable (the interpreter will stop on the first line or
-- when debugging starts); some interpreters may use `true` or `false`
-- by default, but can be still reconfigured with this setting. 
debugger.runonstart = true

-- to set compact fold that doesn't include empty lines after a block
editor.foldcompact = true

-- to disable zoom with mouse wheel as it may be too sensitive on OSX
editor.nomousezoom = true

