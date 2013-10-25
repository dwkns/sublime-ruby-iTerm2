#!/bin/sh
# look throught the supplied path/file and see if lib or spec are in in.
# if they are strip out everything to the directory
# above lib and spec (the expected working directory)
# this is where your Ruby and RSpec 'should' run from.

function rootdir {
  local filename=$1
  local parent=${filename%%/lib/*}
  if [[ $filename == $parent ]]; then
    parent=${filename%%/spec/*}
  fi
  echo $parent

  #set a global to hold the result
  THIS_PATH=$parent
}
# run the function. $1 is the supplied path/file
rootdir $1

# Test $THIS_PATH to see if it has '.rb' in it. 
# If it does lib or spec were not found (the path was not stripped).
# This is a bit clunky and would fail if in the unlikely 
# case that the path (as apposed to your file) has .rb in it.

echo "$THIS_PATH" | grep -q ".rb"
if [ $? -eq 0 ];then
  	#echo "found a .rb"
  	CHANGE_DIR="false"
  else
	#echo "stripped to working dir"
	CHANGE_DIR="true"
fi

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
        --  display dialog "window 1 exists " & the name of the front window
			-- check to see if its busy
			if (window 1 is busy) then
        --  display dialog "window 1 is busy doing command t"
				-- It is busy so open a new tab 
				tell application "System Events" to keystroke "t" using command down
			end if	

            -- nead a real test tp see if the window is actually open becasue on rare
            -- occasions Terminal reports having a window open when it doesn't.

		else
			-- create it
         --   display dialog "window 1 doesn't exist - doing command n"
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
  -- scroll the terminal window to the bottom.
  -- key code 119 is fn and the right cursor  
  tell application "System Events" to keystroke key code 119 
  
	delay my_delay
	set script_string to "$2" & " " & quoted form of "$1" 
	if "$CHANGE_DIR" = "true" then
		do  script "cd $THIS_PATH" in front window
		delay my_delay
	end if

	
  do  script script_string in window 1 
end tell
END