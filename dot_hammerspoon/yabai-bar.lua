if not hs.ipc.cliStatus() then
	if not hs.ipc.cliInstall() then
		hs.ipc.cliUninstall()
		if not hs.ipc.cliInstall() then
			hs.logger.new("yabai-bar"):e("Error installing `hs.ipc` :(")
		end
	end
end

local YabaiBar = {}

-- Constructor
function YabaiBar:new(exec)
	local yabaiBar = {
		bar = hs.menubar.new(),
		exec = exec,
		displays = {},
		spaces = {},
		showAll = true,
		focusedStyle = {
			font = hs.styledtext.defaultFonts.menuBar,
			color = hs.drawing.color.hammerspoon.osx_green,
		},
		visibleStyle = {
			font = hs.styledtext.defaultFonts.menuBar,
			color = hs.drawing.color.hammerspoon.osx_yellow,
		},
		hasWindowsStyle = {
			font = hs.styledtext.defaultFonts.menuBar,
			color = { hex = "#ddd" },
		},
		noWindowsStyle = {
			font = hs.styledtext.defaultFonts.menuBar,
			color = { hex = "#666" },
		},
		spaceSeparator = hs.styledtext.new("  ", {
			font = hs.styledtext.defaultFonts.menuBar,
		}),
		displaySeparator = hs.styledtext.new("｜", {
			font = hs.styledtext.defaultFonts.menuBar,
		}),
		empty = hs.styledtext.new("", {
			font = hs.styledtext.defaultFonts.menuBar,
		}),
	}

	self.__index = self

	return setmetatable(yabaiBar, self)
end

-- Update
function YabaiBar:update()
	local updateMenubarTitle = function()
		if #self.displays == 0 or #self.spaces == 0 then
			return
		end

		local disp = self.empty

		for i, display in ipairs(self.displays) do
			if i > 1 and i <= #self.displays then
				disp = disp .. self.displaySeparator
			end

			for j, space in ipairs(display.spaces) do
				if j > 1 and j <= #display.spaces then
					disp = disp .. self.spaceSeparator
				end

				if self.spaces[space]["has-focus"] == true then
					disp = disp .. hs.styledtext.new(space, self.focusedStyle)
				elseif self.spaces[space]["is-visible"] == true then
					disp = disp .. hs.styledtext.new(space, self.visibleStyle)
				elseif self.spaces[space]["first-window"] ~= 0 then
					disp = disp .. hs.styledtext.new(space, self.hasWindowsStyle)
				else
					disp = disp .. hs.styledtext.new(space, self.noWindowsStyle)
				end
			end
		end

		self.bar:setTitle(disp)
	end

	hs.task.new(self.exec, function(exitCode, stdOut, stdErr)
		if exitCode ~= 0 then
			return
		end

		self.displays = hs.json.decode(stdOut)

		table.sort(self.displays, function(left, right)
			return left.frame.x < right.frame.x
		end)

		updateMenubarTitle()
	end, { "-m", "query", "--displays" }):start()

	hs.task.new(self.exec, function(exitCode, stdOut, stdErr)
		if exitCode ~= 0 then
			return
		end

		local spaces = hs.json.decode(stdOut)

		for _, space in ipairs(spaces) do
			self.spaces[space.index] = space
		end

		updateMenubarTitle()
	end, { "-m", "query", "--spaces" }):start()
end

return YabaiBar
