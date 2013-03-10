#!/usr/bin/ruby
#encoding: utf-8

puts '5-2 ファイル'
File.open("ex5-1.rb"){|f|
	contents = f.read
	print contents
}