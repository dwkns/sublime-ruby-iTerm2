# Sublime Ruby Terminal OS X

> A build system for Sublime Text 3 which runs your .rb files in the Terminal. OS X only.

### What does it do?

Opens a terminal window and passes your current .rb file to the default Ruby. This is useful when you have a script which requires user input (such as gets.chomp) something the Sublime console doesn't allow. 

If Terminal is not open, it will be opened.

If Terminal is open the front window will be used. If no window is open one will be created.

If Terminal is open and the front window is busy, a new Tab will be used.

---

### Installation
Clone the repo into the right place

    $ cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
    $ git clone https://github.com/dwkns/sublime-ruby-terminal.git 

Make **ruby-terminal.sh** executable

    $ chmod u+x sublime-ruby-terminal/ruby-terminal.sh

Add a link from /usr/local/bin to the build script to ensure it runs
	
	$ ln -s ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/sublime-ruby-terminal/ruby-terminal.sh /usr/local/bin

Set ruby-terminal to be the default build system in Sublime

Tools > Build System > ruby-terminal


### Usage

In sublime :

create a .rb file such as 

---
