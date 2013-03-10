#!/usr/bin/ruby

File.open("time.log", 'a'){|f|
	f.puts Time.now
}