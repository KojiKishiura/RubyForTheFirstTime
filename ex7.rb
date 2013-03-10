#!/usr/bin/ruby
#encoding: utf-8

puts "'\n7-1.レシーバ省略"
class Laputa
	def hover
		vibrate = 1
		p vibrate
		self.vibrate
	end
	def vibrate
		p "vibrated"
	end
end
takalamakhan = Laputa.new
takalamakhan.hover

puts "\n7-2.関数的メソッド"
def functional_method(a, b)
	return [a, b, a + b]
end
p functional_method(1, 2)
# 数学関数(Math.sin etc)などはMathをレシーバにしているが
# 実際にはレシーバの情報を一切使用していない
# したがって関数やサブルーチンと似たような役割をはたすので関数メソッドと呼ばれる
# なお、Rubyでは形式的にはレシーバを用いるため純粋な意味での「関数」は存在しない

puts "\n7-3~4.引数展開"
# def some_method(a, b)
# 	p [a, b]
# end
# array = [3, 4, 5]
# some_method(1, 2, *array)
# some_method(1, 2, *array, *array, 6)
def some_method(a, b)
	p [a, b]
end
params = [1, 2]
x, y = params
# some_method(params)
some_method(x, y)

puts "\n7-5.メソッドの定義-def式"
def sum(x, y)
	x + y
end
def diff x, y
	x - y
end
def prod(x, y) x * y end
def quo x, y; x / y end

p sum(1, 2)
p diff(1, 2)
p prod(1, 2)
p quo(1.0, 2)

puts "\n7-6.return"
def fact(n)
	return 1 if n == 0
	product = 1
	(1 .. n).each do |i|
		product *= i
	end
	return product
end
def fact_other(n); (1..n).inject(1){|p, i| p * i } end
p fact(5)
p fact_other(5)

puts "\n7-7~8.多値の返却"
def some_method(a)
	return a, 1, 2, 3,4
end
def some_method(a)
	[a, 1, 2, 3]
end
a, b, *c = *some_method(0)
p a
p b
p c

puts "\n7-9.値を返さないメソッド"
def black_box_process(x, y)
	@c = x + y
	nil
end
p black_box_process(1,2)

puts "\n7-10.デフォルト値"
def some_method(a, b, c = 1)
	p c
end
some_method(2, 3)

puts "\n7-11.デフォルト値の評価コンテキスト"
def print_time(time = Time.now)
	p time
end
print_time
sleep 1
print_time


puts "\n7-12~13.可変長引数"
def some_method(a, b, *c)
	p [a, b, c]
end
some_method(1,2,3,4,5)

#以下、1.8 => error , 1.9 => true
def some_method(a, *b, c)
	p [a, b, c]
end
some_method(1,2,3,4,5)

puts "\n7-14.ブロック付きメソッド"
verse = "桃之夭夭 灼灼其華 \n之子于帰 宣其室家 \n"
count = 0
verse.each_line do |line|
	print line
	count += 1
end

puts "\n7-15.環境の保存"
def create_counter
	count = 1
	return Proc.new do
		count += 1
		p count
	end
end
counter = create_counter
p counter.class
counter.call
counter.call

puts "\n7-16.環境の保存"
counter2 = create_counter
counter2.call
counter.call
counter2.call

puts "\n7-17.ブロック引数とブロックローカル変数"

a = 'str'
[1, 2, 3].each{|a|  p a }
p a

puts "\n7-18.ブロック引数に続けて任意のブロックローカル変数を宣言"
a , b = "str", "ing"
[1, 2, 3].each do |i; a, b|
	a, b = 1, 2
end
p a, b

puts "\n7-19.ブロック内で初出のローカル変数はブロック外で使用するとNameError"
(1..10).each do |i|
	last_odd = i if i%2 != 0
end
#p last_odd

puts "\n7-20.ブロック内での結果をブロックの外で参照するには初期化が必要"
last_odd = nil
(1..10).each do |i|
	last_odd = i if i%2 != 0
end
p last_odd


puts "\n7-21"
[[1,2],[3,4]].each do |a, b|
	p [a, b]
end

puts "\n7-22"
# 以下はRuby1.8では正常、1.9ではError
# [2,3].each do |@a|
	#do something
# end
# p @a #=>3 

puts "\n7-23"
a =1
[2, 3].each do |a|
	# do something
end
p a
#Ruby1.8 => 3 , Ruby1.9 => 1
# Ruby1.8ではブロック引数でローカル変数と同一名を使用すると変数の値を上書きする
# こうしたエラーを防ぐには以下の点を意識する
# 	・外部のローカル変数と同盟のブロック引数を用いない
# 	・外部で既出のローカル変数は、ブロック内外で共有される

puts "\n7-24.ブロック付きメソッドの定義"
def foo_bar_baz
	yield "foo"
	yield "bar"
	yield "baz"
end
foo_bar_baz do |item|
	puts item
end

# yield式はメソッド内から曜日出し側のブロックをコールバックする構文
# ０個以上の式を取ることができ、それらの式の値をブロック呼び出し時にブロック引数として渡す

puts "\n7-25.イテレータの中のyield"
def foo_bar_baz2
	%w[ foo bar baz ].each do |item|
		yield item
	end
end
foo_bar_baz2 do |item|
	puts item
end

puts "\n7-26.Enumerator"
def foo_bar_baz3
	#ブロックを与えられていないとき、enum_forでEnumeratorを生成して返す
	return enum_for(:foo_bar_baz3) unless block_given?
	%w[ foo bar baz ].each do |item|
		yield item
	end
end

foo_bar_baz3 do |item|
	puts item
end
p foo_bar_baz3

puts "\n7-27.yieldの評価値"
def my_map
	[yield(1), yield(2), yield(3)]
end
p my_map {|i| i +1}
# p my_map  # 呼び出し側がブロックを付けずにyieldをもつメソッドを呼んだ場合
			   # コールバックすべき対象がなく、LocalJumpError(no block given)の例外が発生

puts "\n7-28.Proc 呼び出し側のブロックをオブジェクトを取得する"
class SleepyPerson
	def register_handler(&handler)
		@event_handler = handler
	end
	def wake_up!
		@event_handler.call Time.now, "woke up"
	end
end
john = SleepyPerson.new
john.register_handler {|time, message| p [time, message]}
john.wake_up!

# このへんはちゃんと理解できていない気がする

puts "\n7-29.Procからブロック"
proc = Proc.new {puts "Proc was called"}
3.times(&proc)

