#!/bin/sh
osascript <<END 
property my_delay : 0.5
on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

set isItRunning to is_running("Terminal")

if isItRunning then
	tell application "Terminal"
		activate
		if (window 1 exists) then
			
			-- check to see if it's busy
			if (window 1 is busy) then
				-- It is busy so open a new tab 
				tell application "System Events" to keystroke "t" using command down
			else
				set my_delay to 0
			end if
			
		else
			-- create it
			tell application "System Events" to keystroke "n" using command down
		end if
	end tell
else
	tell application "Terminal"
		activate
	end tell
end if


tell application "Terminal"
activate
	delay my_delay
	-- do script "echo hello" in window 1
	set run_which_program to do shell script "echo '$2'"
	set script_string to (run_which_program as string) & " $1" 
	do script script_string in window 1
end tell
END