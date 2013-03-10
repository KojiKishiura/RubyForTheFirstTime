#!/usr/bin/ruby

File.open("ex5-9-output.txt","w"){|f|
	$stdout = f
	puts "Welcom to Glubbdubdrib"
	$stdout = STDOUT
}