#!/usr/bin/ruby

File.open("05-004-datafile", File::WRONLY|File::CREAT) {|f|
	f.puts Time.now
}