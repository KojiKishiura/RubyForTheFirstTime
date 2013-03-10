#!/usr/bin/ruby
#encoding: utf-8

File.open("ex4-2.rb", "r:UTF-8") {|f|
	p f.read.encoding
}