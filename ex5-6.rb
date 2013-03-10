#!/usr/bin/ruby

puts '5-6 Random Access'
File.open("ex4-2.rb", "r+b"){|f|
	print "#{f.pos}:"
	print f.gets
	print "#{f.pos}:"
	puts bytes = f.read(3)
	print "#{f.pos}:\n"
	f.pos -= 3
	print "#{f.pos}:"
	f.write bytes
	print "#{f.pos}:"
	f.pos = 0
	print f.gets
	puts "#{f.pos}:"
	f.seek(-1, File::SEEK_END)
	print "#{f.pos}:"
	puts f.getc
	print "#{f.pos}:"
	p f.getc
	print "#{f.pos}"
	puts f.readchar
}