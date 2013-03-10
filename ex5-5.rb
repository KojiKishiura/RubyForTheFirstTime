#!/usr/bin/ruby

File.open("ex4-9-3.rb"){|f|
	f.each_line do |line|
		print "#{f.lineno}: #{line}"
	end
}