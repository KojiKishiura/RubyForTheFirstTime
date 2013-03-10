#!/usr/bin/ruby
#encoding: utf-8

p "あいう".length

str = "あいう"
p str[0], str[1], str[2]

str = "αβc"
puts str.upcase

str  = "\xe6\x97\xa5\xe6\x9c\xac\xe8\xaa\x9e"
$KCODE = 'UTF8'
puts str.inspect
$KCODE = 'SJIS'
puts str.inspect