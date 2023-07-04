#!/usr/bin/osascript

if application "Firefox" is running then
	
	tell application "System Events"
		tell process "Firefox"
			click menu item "New Window" of menu "File" of menu bar 1
		end tell
	end tell
else
	activate application "Firefox"
end if
