#!/usr/bin/ruby

a = 1
b = "str"

c = [a, b, 3, "文字列"]
d = [a, c, [1, 2, 3]]

p a
p b
p c
p d

#2-3
p "2-3"
p c[0]
p c[1]
p c[2]
p c[3]
p c[4]
p d[2]

#2-4
p "2-4"
p c[-1]
p c[-2]
p c[-5]

#2-5
p "2-5"
p c[1, 2]
p c[1, 3]
p c[1, 4]
p c[-2, 2]
p c[4, 2]

#2-6
p "2-6"
p c[0..1]
p c[0...1]
p c[-2..-1]
p c[-2..3]
p c[-2...3]
p c[4..5]

#2-7
p "2-7"
p a = [1, 2]
a[0] = 3
p a
a[4] = "4"
p a
a[0, 3] = 'a', 'b', 'c'
p a
a[0, 3] = 'a', 'b', 'c', 'd'
p a
a[1..2] = 1, 2
p a
a[0, 2] = "?"
p a
a[0..2] = "A"
p a
a[-1] = "Z"
p a

#2-8
p "2-8"
p a = ["a", "b"]
p a[-3]
#a[-3] = 1

#2-9
p "2-9"
array1 = [1, 2, "str"]
p array1
array2 = [1, 2, "str"]
p array2
p array1 == array2
p array1 == ["str", 1, 2]
p array1 == ["str", 1, 2, "extra"]

#2-10
p "2-10"
array = ["a", "b", "c"]
p array.length
p array.size
p array *= 2

p array.include? "c"
p array.sort
p array
p array.uniq
array.uniq!
p array

#2-11
p "2-11"
array = ["a", "b", "c"]
array.each do |item|
	print item + " "
end
p 

#2-12
p "2-12"
array.each_with_index do |item, index|
	p [item, index]
end

#2-13
p "2-13"
acids = ["Adenin", "Thymine", "Guanine", "Cytosine"]
signs = acids.map{|acid| acid[0,1]}
p signs

#2-14
p "2-14"
p acids.map{|a| a.downcase}
p acids.map(&:downcase)

#2-15
p "2-15"
array = ["73", "2", "5", "1999", "53"]
p array.sort
p array.sort{|x, y| x.to_i <=> y.to_i}