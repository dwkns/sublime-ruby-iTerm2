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
 
    echo "found a .rb"
    CHANGE_DIR="false"
  else
  
  echo "stripped to working dir"
  CHANGE_DIR="true"
fi

osascript <<END 
tell application "iTerm"
  
  set numberOfWindows to count terminal windows
  if (count terminal windows) is 0 then
    -- no window is open. Open one.
    set createWindow to true
    
  else
    -- there is a window open
    tell current session of current window
      if (is processing) or (name is not "bash") then
        set createTab to true
      end if
    end tell
  end if
  
  if (createTab) then
    tell current window
      create tab with default profile
    end tell
  end if
  
  if (createWindow) then
    create window with default profile
  end if
  
  tell current session of current window
    
  end tell
  
  -- scroll the terminal window to the bottom.
  -- key code 119 is fn and the right cursor  
  tell application "System Events" to keystroke (key code 119)
  
  set script_string to "$2" & " " & quoted form of "$1"
  if "$CHANGE_DIR" = "true" then
    write "cd $THIS_PATH"
    delay my_delay
  end if
  
  
end tell

END