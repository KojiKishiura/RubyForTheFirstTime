#!/usr/bin/ruby

#2-17
p "2-17"
month_to_ordinal = {
	"Jan" => 1, "Feb" => 2, "Mar" => 3, "Apr" => 4, "May" => 5, "Jun" => 6,
	"Jul" => 7, "Aug" => 8, "Sep" => 9, "Oct" => 10, "Nov" => 11, "Dec" => 12
}

p month_to_ordinal["Aug"]
p month_to_ordinal["Jun"]

#2-18
p "2-18"
prefix = "yapoo-"
addreviation = {
	"CAT" => "Condensed-Abridged Tiger",
	"Yapomb" => prefix + "womb",
	"pilk" => prefix + "milk"
}
p addreviation
p addreviation["Yapomb"]

#2-19
p "2-19"
#params = {rin: 5, kimiko: 7, kayo: nil}
#p params

#2-20
p "2-20"
book_to_author = {
	"Ruby in Nutshell" => "Flanagan",
	"Programming Ruby" => "Thomas",
	"AWDwR" => "Thomas"
}  
p book_to_author["Programming Ruby"]
p book_to_author["Programming Perl"]
book_to_author["Ruby in Nutshell"] = ["Flanagan", "Matz"]
p book_to_author
book_to_author["The Ruby Way"] = "Fulton"
p book_to_author

#2-21
p "2-21"
user_mapping = {"kayo" => nil}
p user_mapping.key? "kayo"
p user_mapping.key? "tetsu"
p user_mapping.fetch("kayo")
#p user_mapping.fetch("tetsu")

#2-22
p "2-22"
hash1 = {"a" => 1, "b" => 2}
hash2 = {"a" => 1, "b" => 2}
p hash1 == hash2
p hash1 == {"b" => 2, "a" => 1}
p hash1 == {"a" => 9, "b" => 2}
p hash1 == {"z" => 1, "b" => 2}
p hash1 == {"a" => 1, "b" => 2, "c" => 3}

#2-23
p "2-23"
book_to_author.each do |book, author|
	puts "#{book} by #{author}"
end

#2-24
p "2-24"
p book_to_author.map{|book, author|
	"#{book} by #{author}"
}

#2-26
p "2-26"
require 'enumerator'
p book_to_author.enum_for(:each_with_index).map{|(book, author), index|
	"#{index+1}. #{book}"
}

#2-27
p "2-27"
p book_to_author.map.with_index {|(book, author), index|
	"#{index+1}. #{book}"
}