-- This is a file that sets color scheme based on Tomorrow format.
-- Copyright 2011-12 Paul Kulchenko, ZeroBrane LLC

-- Tomorrow colors from https://github.com/chriskempson/tomorrow-theme
-- Zenburn colors from https://github.com/jnurmine/Zenburn/blob/master/colors/zenburn.vim (contributed by Srdjan Marković)
-- Monokai colors from http://www.monokai.nl/blog/2006/07/15/textmate-color-theme/
-- Solarized colors from https://github.com/altercation/vim-colors-solarized

local theme = ...

local function h2d(n) return 0+('0x'..n) end
local function H(c, bg) c = c:gsub('#','')
  -- since alpha is not implemented, convert RGBA to RGB
  -- assuming 0 is transparent and 255 is opaque
  -- based on http://stackoverflow.com/a/2645218/1442917
  local bg = bg and H(bg) or {255, 255, 255}
  local a = #c > 6 and h2d(c:sub(7,8))/255 or 1
  local r, g, b = h2d(c:sub(1,2)), h2d(c:sub(3,4)), h2d(c:sub(5,6))
  return {
    math.min(255, math.floor((1-a)*bg[1]+a*r)),
    math.min(255, math.floor((1-a)*bg[2]+a*g)),
    math.min(255, math.floor((1-a)*bg[3]+a*b))}
end

local colors = {
  Tomorrow = {
    Background  = H'ffffff',
    CurrentLine = H'efefef',
    Selection   = H'd6d6d6',
    Foreground  = H'4d4d4c',
    Comment     = H'8e908c',
    Red         = H'c82829',
    Orange      = H'f5871f',
    Yellow      = H'eab700',
    Green       = H'718c00',
    Aqua        = H'3e999f',
    Blue        = H'4271ae',
    Purple      = H'8959a8',
  },
  TomorrowContrast = { -- contributed by Sergey Lerg
    Background  = H'f7f7f7',
    CurrentLine = H'efefef',
    Selection   = H'd6d6d6',
    Foreground  = H'202020',
    Comment     = H'8e908c',
    Red         = H'4669ff', --numbers
    Orange      = H'f5871f',
    Yellow      = H'eab700',
    Green       = H'108010', --strings
    Aqua        = H'4060b0', --built in functions
    Blue        = H'101080', --keywords
    Purple      = H'a01090',
  },
  TomorrowNight = {
    Background  = H'1d1f21',
    CurrentLine = H'282a2e',
    Selection   = H'373b41',
    Foreground  = H'c5c8c6',
    Comment     = H'969896',
    Red         = H'cc6666',
    Orange      = H'de935f',
    Yellow      = H'f0c674',
    Green       = H'b5bd68',
    Aqua        = H'8abeb7',
    Blue        = H'81a2be',
    Purple      = H'b294bb',
  },
  TomorrowNightEighties = {
    Background  = H'2d2d2d',
    CurrentLine = H'393939',
    Selection   = H'515151',
    Foreground  = H'cccccc',
    Comment     = H'999999',
    Red         = H'f2777a',
    Orange      = H'f99157',
    Yellow      = H'ffcc66',
    Green       = H'99cc99',
    Aqua        = H'66cccc',
    Blue        = H'6699cc',
    Purple      = H'cc99cc',
  },
  TomorrowNightBlue = {
    Background  = H'002451',
    CurrentLine = H'00346e',
    Selection   = H'003f8e',
    Foreground  = H'ffffff',
    Comment     = H'7285b7',
    Red         = H'ff9da4',
    Orange      = H'ffc58f',
    Yellow      = H'ffeead',
    Green       = H'd1f1a9',
    Aqua        = H'99ffff',
    Blue        = H'bbdaff',
    Purple      = H'ebbbff',
  },
  TomorrowNightBright = {
    Background  = H'000000',
    CurrentLine = H'2a2a2a',
    Selection   = H'424242',
    Foreground  = H'eaeaea',
    Comment     = H'969896',
    Red         = H'd54e53',
    Orange      = H'e78c45',
    Yellow      = H'e7c547',
    Green       = H'b9ca4a',
    Aqua        = H'70c0b1',
    Blue        = H'7aa6da',
    Purple      = H'c397d8',
  },
  Zenburn = {
    Background  = H'3f3f3f',
    CurrentLine = H'363636',
    Selection   = H'1f1f1f',
    Foreground  = H'dcdccc',
    Comment     = H'7f9f7f',
    Red         = H'8cd0d3',
    Orange      = H'dfaf8f',
    Yellow      = H'e3ceab',
    Green       = H'cc9393',
    Aqua        = H'dca3a3',
    Blue        = H'f0dfaf',
    Purple      = H'efef8f',
  },
  Monokai = {
    Background  = H'1D1E1A',
    CurrentLine = H'1D1E1A',
    Selection   = H'39382F',
    Foreground  = H'F6F6EF',
    Comment     = H'625E4C',
    Red         = H'9D65FF',
    Orange      = H'F88319',
    Yellow      = H'F6F6EF',
    Green       = H'E0D562',
    Aqua        = H'58D1EB',
    Blue        = H'F3005F',
    Purple      = H'98E024',
  },
  SolarizedDark = {
    Background  = H'042029',
    CurrentLine = H'0A2933',
    Selection   = H'073642',
    Foreground  = H'839496',
    Comment     = H'586E75',
    Red         = H'D33682',
    Orange      = H'B58900',
    Yellow      = H'839496',
    Green       = H'2AA198',
    Aqua        = H'839496',
    Blue        = H'859900',
    Purple      = H'268BD2',
  },
  SolarizedLight = {
    Background  = H'FDF6E3',
    CurrentLine = H'EEE8D5',
    Selection   = H'E0E0D0',
    Foreground  = H'586E75',
    Comment     = H'93A1A1',
    Red         = H'D33682',
    Orange      = H'B58900',
    Yellow      = H'586E75',
    Green       = H'2AA198',
    Aqua        = H'586E75',
    Blue        = H'859900',
    Purple      = H'268BD2',
  },
}

-- add more of the specified color (keeping all in 0-255 range)
local mixer = function(c, n, more)
  if not c or #c == 0 then return c end
  local c = {c[1], c[2], c[3]} -- create a copy, so it can be modified
  c[n] = c[n] + more
  local excess = c[n] - 255
  if excess > 0 then
    for clr = 1, 3 do
      c[clr] = n == clr and 255 or c[clr] > excess and c[clr] - excess or 0
    end
  end
  return c
end

local C = colors[theme] or colors.Tomorrow
return {
  -- wxstc.wxSTC_LUA_DEFAULT
  lexerdef = {fg = C.Foreground},
  -- wxstc.wxSTC_LUA_COMMENT, wxstc.wxSTC_LUA_COMMENTLINE, wxstc.wxSTC_LUA_COMMENTDOC
  comment = {fg = C.Comment, fill = true},
  -- wxstc.wxSTC_LUA_STRING, wxstc.wxSTC_LUA_CHARACTER, wxstc.wxSTC_LUA_LITERALSTRING
  stringtxt = {fg = C.Green},
  -- wxstc.wxSTC_LUA_STRINGEOL
  stringeol = {fg = C.Green, fill = true},
  -- wxstc.wxSTC_LUA_PREPROCESSOR
  preprocessor = {fg = C.Orange},
  -- wxstc.wxSTC_LUA_OPERATOR
  operator = {fg = C.Foreground},
  -- wxstc.wxSTC_LUA_NUMBER
  number = {fg = C.Red},

  -- wxstc.wxSTC_LUA_WORD, wxstc.wxSTC_LUA_WORD2-8
  keywords0 = {fg = C.Blue, b = true},
  keywords1 = {fg = C.Red, b = false},
  keywords2 = {fg = C.Aqua, b = false},
  keywords3 = {fg = C.Purple, b = false},
  keywords4 = {fg = C.Purple, b = false},
  keywords5 = {fg = C.Aqua, b = false},
  keywords6 = {fg = C.Purple, b = true},
  keywords7 = {fg = C.Purple, b = false},

  -- common (inherit fg/bg from text)
  -- wxstc.wxSTC_LUA_IDENTIFIER
  text = {fg = C.Foreground, bg = C.Background},
  linenumber = {fg = C.Comment},
  bracematch = {fg = C.Blue},
  bracemiss = {},
  ctrlchar = {fg = C.Yellow},
  indent = {fg = C.Comment},
  calltip = nil,

  -- common special (need custom fg & bg)
  calltipbg = nil,
  sel = {bg = C.Selection},
  caret = {fg = C.Foreground},
  caretlinebg = {bg = C.CurrentLine},
  fold = {fg = C.Comment, bg = C.Background},
  whitespace = {fg = C.Comment, bg = C.Background},

  indicator = {
    fncall = {fg = C.Purple, st = wxstc.wxSTC_INDIC_ROUNDBOX},
    --[[ other possible values are:
      wxSTC_INDIC_PLAIN	 Single-line underline
      wxSTC_INDIC_SQUIGGLE Squiggly underline
      wxSTC_INDIC_TT	 Line of small T-shapes
      wxSTC_INDIC_DIAGONAL Diagonal hatching
      wxSTC_INDIC_STRIKE	 Strike-out
      wxSTC_INDIC_BOX      Box
      wxSTC_INDIC_ROUNDBOX Rounded Box
    --]]
    -- these indicators have all different default styles
    varlocal = {fg = C.Aqua},
    varglobal = {fg = C.Aqua},
    varmasked = {fg = C.Blue},
    varmasking = {fg = C.Blue},
  },

  -- markup
  ['['] = {hs = mixer(C.Comment, 3, 64)},
  ['|'] = {fg = mixer(mixer(C.Comment, 1, 64), 3, 64)},

  -- markers
  marker = {
    message = {bg = C.Selection},
    output = {bg = C.CurrentLine},
    prompt = {fg = C.Foreground, bg = C.Background},
    error = {bg = mixer(C.Background, 1, 32)},
  },
}

--[[

---- Solarized license ----

Copyright (c) 2011 Ethan Schoonover

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--]]
