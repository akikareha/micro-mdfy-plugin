VERSION = "0.0.0"

local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")

function urlToMarkdown(bp)
	local line, col = bp.Cursor.Y, bp.Cursor.X
	local text = bp.Buf:Line(line)

	local col1 = col + 1

	local s = col1
	if not text:sub(s, s):match("[%w%p]") then
		s = s - 1
	end
	while s > 0 and text:sub(s, s):match("[%w%p]") do
		s = s - 1
	end
	s = s + 1

	local e = col1
	if not text:sub(e, e):match("[%w%p]") then
		e = e - 1
	end
	while e <= #text and text:sub(e, e):match("[%w%p]") do
		e = e + 1
	end
	e = e - 1

	if s > e then
		micro.InfoBar():Message("No word found")
		return
	end

	local word = text:sub(s, e)
	if not word:match("^https?://") then
		micro.InfoBar():Message("Not a URL")
		return
	end

	local path = word:match("https?://.*/(.-)/?$") or word
	if path == "" then
		path = word
	end
	local link = "[" .. path .. "](" .. word .. ")"

	bp.Buf:Replace(buffer.Loc(s - 1, line), buffer.Loc(e, line), link)
end

function init()
	config.MakeCommand("mdfy", urlToMarkdown, config.NoComplete)
	config.TryBindKey("Ctrl-Alt-g", "lua:mdfy.urlToMarkdown", false)
	config.AddRuntimeFile("mdfy", config.RTHelp, "help/mdfy.md")
end
