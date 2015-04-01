# Sublime Ruby iTerm2



> A build system for Sublime Text 3 which runs your .rb files in iTerm2. OS X only.

### Important 
You must use v2.9 or later of iTerm. Currently that means using one of the [nightly builds](http://iterm2.com/downloads/nightly/#/section/home).

### What does it do?
Opens a terminal window and passes your current .rb file to the default Ruby or RSpec. 

With Ruby this is useful when you have a script which requires user input (such as gets.chomp) something the Sublime console doesn't allow. The RSpec build system is included so your tests run in the same enviroment as your scripts. 

---

### Installation
Clone the repo into the right place

    $ cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
    $ git clone https://github.com/dwkns/sublime-ruby-iTerm2.git

Make `ruby-iterm2.sh` executable

    $ chmod u+x sublime-ruby-iTerm2/ruby-iterm2.sh

Add a link from `/usr/local/bin` to the build script to ensure it runs
	
	$ ln -s ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/ruby-iTerm2/ruby-iTerm2.sh /usr/local/bin

Set ruby-terminal to be the default build system in Sublime

`Tools > Build System > ruby-iTerm2`


### Usage

**Ruby**
In sublime create a new ruby file such as `main.rb` :

	print "Enter some text : "
	output = gets.chop
	puts "You entered : " + output

Hit <kbd>⌘B</kbd> to run the file.


The Terminal will open and `ruby path/to/main.rb` will be run.

**RSpec**
In sublime create a new RSpec file such as `test.rb` :


	describe "main" do 
		it "should be true if it's true" do
			expect( true ).to eq true 
		end
	end

Hit <kbd>⇧⌘B</kbd> to run the file with RSpec.

The Terminal will open and `rspec path/to/test.rb` will be run.

---

### How it works
`ruby-iTerm2.sh` uses some Applescript (hence OS X only) to open iTerm2 and pass in your .rb file.

If iTerm2 is not open, it will be opened.

If iTerm2 is open the front window will be used. If no window is open one will be created.

If iTerm2 is open and the front window is busy, a new Tab will be created and used.

### Version history
**v0.0.3** - 21th March 2015 - Latest version
- Updated to use iTerm2 rather than Terminal. This is now possible because of the updated Applescript support in v2.9

**v0.0.2** - 25th October 2013 
- increased the Applescript delay before commands are run.
Sometimes (depending on system load) the AppleScript would try and run the commands before iTerm2 was ready. This occasionally led to unpredictable behaviour.

- added an Applescript command to automatically scroll the window to the end. Useful if you've previously scrolled up to review your RSpec output

- code snippets removed. They should be in thier own package, not bundeled in with a build system. 

**v0.0.1** - 5th October 2013 - intial version
