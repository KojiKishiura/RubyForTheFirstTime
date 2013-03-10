#!/usr/bin/ruby
#encoding: utf-8
puts "-- ex.6-1 --"
cattle = "yahoo"
cattle.length
animal = cattle
cattle[2] = ?p
p cattle
p animal
p cattle.equal? animal
#変数；オブジェクトにつける名札

puts "\n-- ex.6-2 --"
def describe(name)
	p name.object_id
	name = name.dup # 複製（新たなオブジェクト）
	p name.object_id
	puts "This is a #{name}."
	name[2] = ?p
	puts "This is a #{name}."
end

CATTLE = "yahoo"
describe(CATTLE)
p CATTLE

puts "\n-- ex.6-3 --"
#変数名規則
# 小文字orアンダースコア	：ローカル変数			(ex. local_variable)
# @                         		：インスタンス変数		(ex. @instance_variable)
# @@						：クラス変数			(ex. @@class_variable)
# $ 						：グローバル変数		(ex. $global_variable)
# 大文字					：定数					(ex. CONSTANT_VALUE)
def next_of(origin)
	value = origin + 1
	p value
end
def prev_of(origin)
	value = origin - 1
	p value
end

next_of(2)
next_of(2)
prev_of(2)
# p value
# p underfined_variable

puts "\n-- ex.6-4 --"
class Duration
	attribute_names = %w[ days hours minutes seconds]
	p attribute_names
	attribute_names.each do |name|
		attr_accessor name
	end
end
# p attribute_names

puts "\n-- ex.6-7 --"
0.upto(9){|i| puts i}
str = "Glubbdubdrib"
str.each_byte do |byte|
	printf "%x\n", byte
end

puts "\n-- ex.6-8 --"
a, b = 1,2,3,4,5
p a
p b
a, b, c = 1, 2
p a
p b
p c

puts "\n-- ex.6-9 --"
a , *b = 1,2,3,4,5
p b

puts "\n-- ex.6-10 --"
array = [1,2,3]
a,b,c = *array
p a;p b; p c

puts "\n-- ex.6-11 --"
array = [1, 2]
a, b, *c, d = *array, 3, 4, 5
p a
p b
p c
p d

puts "\n-- ex.6-12 --"
(a, (b, (c, d)), e) = [1, [2, [3, 4]], 5]
p [a, b, c, d, e] 

puts "\n-- ex.6-13 --"
p !0
class Integer
	def !@; return true end
end
p !0
p !!0
if  0 then 
	puts '0 is truth'
end

puts "\n-- ex.6-14 --"
def method_with_side_effect
	puts "副作用が発生しました。"
	return 1
end
# メソッドは呼ばれない
p true || method_with_side_effect 
# メソッドが呼ばれる
p false || method_with_side_effect

puts "\n-- ex.6-15 --"
def generate_default_value
	p 'default value generate'
	return 'default value'
end
def some_method(param = nil)
	param ||= generate_default_value
	# p param
end

some_method(nil)
some_method(false)
some_method(true)
some_method(0)
some_method()

puts "\n-- ex.6-16 --"
for i in 0...10
	puts i
end

puts "\n-- ex.6-17 --"
value = -1
p case value
	when 0			then '0'
	when 1..9  		then '1桁'
	when 10..99	then '2桁'
	else					  'それ以外'
end

puts "\n-- ex.6-18 --"
value = "990"
p case value
	when '0'			then '0'
	when /\A\d\Z/	then '1桁'
	when /\A\d{2}\Z/	then '2桁'
	else						  "それ以外"
end
