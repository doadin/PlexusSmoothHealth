--[[
	Copyright (c) 2013 Bastien Clément

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

if not _G.Plexus then
	return
end

local function Debug(str, ...)
    if not str or strlen(str) == 0 then return end

    if (...) then
        if strfind(str, "%%%.%d") or strfind(str, "%%[dfqsx%d]") then
            str = format(str, ...)
        else
            str = strjoin(" ", str, tostringall(...))
        end
    end

    local name = "PlexusSmoothHealth"
    DEFAULT_CHAT_FRAME:AddMessage(format("|cffff9933%s:|r %s", name, str))
end

local LibSmooth = LibStub:GetLibrary("LibSmoothStatusBar-2.0")

if not type(LibSmooth == "table") then
	Debug("requires LibSmoothStatusBar-2.0 But Could Not Be Loaded!")
end

local PlexusFrame = Plexus:GetModule("PlexusFrame")

local function InitializeFrame(_, frame)
	LibSmooth:SmoothBar(frame.indicators.bar)
end

hooksecurefunc(PlexusFrame, "InitializeFrame", InitializeFrame)
