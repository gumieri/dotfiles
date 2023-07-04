#!/usr/bin/osascript

if application "iTerm" is running then
	
	tell application "System Events"
		tell process "iTerm2"
			click menu item "New Window" of menu "Shell" of menu bar 1
		end tell
	end tell
else
	activate application "iTerm"
end if

return input
