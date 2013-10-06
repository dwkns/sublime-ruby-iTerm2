# Sublime Ruby Terminal

> Two build systems for Sublime Text 3 which runs your .rb files in the Terminal. OS X only.

### What does it do?
Opens a terminal window and passes your current .rb file to the default Ruby or RSpec. With Ruby this is useful when you have a script which requires user input (such as gets.chomp) something the Sublime console doesn't allow. 

The RSpec

If Terminal is not open, it will be opened.

If Terminal is open the front window will be used. If no window is open one will be created.

If Terminal is open and the front window is busy, a new Tab will be used.

---

### Installation
Clone the repo into the right place

    $ cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
    $ git clone https://github.com/dwkns/sublime-ruby-terminal.git 

Make `ruby-terminal.sh` executable

    $ chmod u+x sublime-ruby-terminal/ruby-terminal.sh

Add a link from `/usr/local/bin` to the build script to ensure it runs
	
	$ ln -s ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/sublime-ruby-terminal/ruby-terminal.sh /usr/local/bin

Set ruby-terminal to be the default build system in Sublime

`Tools > Build System > ruby-terminal` for Ruby; or
`Tools > Build System > ruby-terminal` for RSpec


### Usage
In sublime create a new ruby file such as `test.rb` :

	print "Enter some text : "
	output = gets.chop
	puts "You entered : " + output

Hit <kbd>⌘B</kbd> to run the file.

The Terminal will open and `test.rb` will be run.

---

### How it works
`ruby-terminal.sh` uses some Applescript (hence OS X only) to open Terminal and pass in your .rb file.
