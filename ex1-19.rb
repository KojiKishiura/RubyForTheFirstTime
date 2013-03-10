#!/usr/bin/ruby

array = ["Bear", "benford", "Egan"]
p array.map{|name| "G. #{name}"}
hash = {
	"Baxter" => "Stephen", "Stross" => "Charles", "Reynolds" => "Alastair"
}
hash.each do |key, value|
	puts "#{value} #{key}"
end
str = "KojiKishiura"
str.each_char{|s| puts s}

File.open('ex1-18.rb') {|f|
	print f.read
}