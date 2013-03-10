#!/usr/bin/ruby
#encoding: utf-8

 puts "\n8-01.クラス定義"
 # クラスDurationを定義
 class Duration
 	1 + 1			# クラス定義の中には任意の式を書くことが出来る
 end
# クラス名は必ず大文字で始まる識別子 => クラス名が定数名
# Durationクラスを表すClassクラスインスタンスを作成し
# そのインスタンスへの参照を値として、Durationという定数を初期化する、


puts "\n8-02.継承"
# class Duration < Range
# end
# < ：Durationは'<'の右に記載されたクラスを継承する
# 親クラスを省略した場合はObjectクラスを継承する
# 一般的には変更不能なクラスのサブクラスが変更可能なのは良くない

puts "\n8-03.インスタンスメソッドの定義"
class Duration
	def display; puts self end
end
duration = Duration.new
duration.display
# displayメソッドはDurationクラスのインスタンスメソッド
# Durationクラスのインスタンスは全てdisplayメソッドを持つ
# なお、トップレベル関数もObjectクラスのインスタンスメソッド
# そのためトップレベルに定義したメソッドはレシーバがなんであれ呼び出すことが出来る。
# したがって、任意の箇所でレシーバ商略形式により呼び出すことが出来る


puts "\n8-04.クラスメソッドの定義"
class Duration
	def Duration.print(x); p x end
end
Duration.print 1	# インスタンスの生成を行わずにprintメソッドを呼び出せる。
# staticメソッドの定義（クラス全体に属するメソッド）
# 以下のように定義することも可能
puts "\n8-05.クラスメソッドの定義"
class Duration
	def self.print(x); p x end
end
Duration.print 1

puts "\n8-06.インスタンス化"
class Duration
	def initialize(since, till)
		@since = since
		@until = till
	end
	attr_accessor :since, :until   # 属性へのgetterとsetterを定義する
end
duration = Duration.new(Time.now, Time.now + 3600)
p duration.until
p duration.since = Time.now
p duration.since += 10
p duration.since += 10
p duration.since += 10
# クラスのインスタンス化 =>クラスメソッドnew
# newの引数はinitializeに渡される
# インスタンスメソッドinitializeは構築した直後に自動的に呼ばれる
# 初期化処理を行ったり、リソースを確保できる（≒コンストラクタ）

puts "\n8-07.属性"
# 属性も単なるメソッド => メソッド呼び出しのカッコは省略可能なのでメソッドには見えず変数のように見える
# 属性への設定は属性と演算子(=etc)の間に空白が入る
# 　=> シンタックスシュガーといい、属性への設定を変数への代入と同じ要領で行うために提供されている

# 属性の定義
# Class#attr_accessorは属性メソッドを定義するメソッド
# 0個以上の文字列またはシンボルを受け取って、その名前の属性を定義する
# 以下attr_accessorの内部定義 -> メタプログラミング機能（プログラムがプログラムを生成する）の一部
# この他にattr_readerとattr_writerの2つのメソッドが存在する。
# なお、メソッド名に予約語を使用することも出来る（不測の事態を防ぐため使用は推奨されない）
def since; return @since end
def since=(value); @since = value end
def until; return @until end
def until=(value); @util = value end

puts "\n8-08.クラス定義の追加"
class String #文字列クラスの定義を再会する
	# カエサル暗号（a->n b->o c->p ... n -> a, ... A->N ... Z->M）を施すメソッドを追加する
	def caesar; tr 'a-zA-Z', 'n-za-mN-ZA-M' end
end
puts "Learning Ruby".caesar
# 定義追加の場合は親クラス指定を省くのが普通 -> クラスのオープン性（クラスはオープンクラスである（
puts "\n8-09.クラス定義の追加"
class Animal; end
class Yahoo < Animal; end
class Yahoo; end
p Yahoo.superclass

puts "\n8-10.クラス定義の上書き"
# 重要なメソッドを上書きすると悲惨なことになりうる
class Fixnum
	alias original_addition +	#元の定義を別のメソッド名で対比する
	def +(rhs)
		original_addition(rhs).succ
	end
end
p 1 + 1
p 5 + 2

puts "\n8-11.クラス定義の上書きの禁止"
# Class#freezeメソッドを使用する
# Fixnum.freeze
# class Fixnum
# 	def +(rhs); return 5 end
# end
# -> can"t modify frozen Class

puts "\n8-12.スーパークラスの呼び出し"
# super式を利用する
class Duration
	def display(target=$>)
		super 				# super(target)と同じ意味
		target.write "(#{self.since}-#{self.until})"
	end
end
duration.display
# superだけを記述すると、現在のメソッドの引数をそのまま引き渡して親クラスの実装を呼び出す
# 引数を渡さずに親クラスの実装を呼び出す場合はsuper()と記述する

puts "\n8-13.インスタンス変数"
class Duration
	def print_since; p @since end
end
duration1 = Duration.new(Time.now-7, Time.now)
duration2 = Duration.new(Time.now+7, Time.now+14)
duration1.print_since
duration2.print_since
# @で始まる名前の変数はインスタンス変数
# インスタンス毎に別々のオブジェクトへの参照を保持している
# インスタンス変数には、所属しているオブジェクトのメソッドからしかアクセス出来ない。
# 注）抜け道もある

puts "\n8-14.クラス変数"
class Foo
	@@class_variable = "foo"		#(1)クラス変数の初期化
	def print
		p @@class_variable		#(2)クラス変数の参照
	end
end
class Bar < Foo
	p @@class_variable			#(3)クラス変数参照
	@@class_variable = "bar"		#(4)クラス変数更新
	def print
		p @@class_variable		#(5)クラス変数参照
	end
end
foo = Foo.new
foo.print 						#(4)で更新された値
bar = Bar.new
bar.print 						#(4)で更新された値
# クラス変数@@class_variableは(1)-(5)で同じ変数を指している
puts "\n8-15.クラス変数"
# 継承階層の外部からはアクセス出来ない
# class Hoge
# 	p @@class_variable 			#NameError
# end
# p @@class_variable 				#NameError

puts "\n8-16.定数"
class Duration
	DAYS_OF_WEEK = 7 			# クラスDurationの定数
	p DAYS_OF_WEEK                 	# クラス内ではそのまま参照できる

	def print_days_of_week
		p DAYS_OF_WEEK 			# インスタンスメソッドでもそのまま参照可能
	end
end
p Duration::DAYS_OF_WEEK 		# 外部からは就職して参照できる
# トップレベルに定数を記述するとObjectクラスの定数になる
# トップレベルの定数にアクセスするには・・・
# 		Object::(定数名) -> Object::DAYS_OF_WEEK
# 		::(定数名)		-> ::DAYS_OF_WEEK

puts "\n8-16.アクセス権限"
# public 		-> どこからでもアクセス可能
# protected 	-> そのクラスまたはサブクラスのインスタンスメソッドからのみ呼び出し可能
# private		-> レシーバ省略形式でのみ呼び出し可能。=>selfに対してしか呼び出せない
# デフォルトではclass式の中で定義されたメソッドはpublic
# デフォルトではトップレベルで定義されたメソッドはprivate
# 引数を付けずにメソッドpublicを呼び出すと、それ以降に定義されるメソッドがpublicになる（protected,privateも同様）
# メソッドpublicにインスタンスメソッド名を文字列またはシンボルで引き渡すと、そのメソッドはpublicに設定される。（protected,privateも同様）
class Yapoo
	def public_method; end
	private 						#以下private
	def internal_use; end
	def public_api
		return internal_use
	end
	public :public_api 			#public_apiをpublicに設定
end
yapoo = Yapoo.new
yapoo.public_api
# yapoo.internal_use 				#NoMethodError(private method 'internal_use' called)

puts "\n8-17.特異メソッドと特異クラス"
# 特定のオブジェクトのためだけのメソッドやクラス
# 特異メソッドはクラスではなくインスタンスに直接所属しているメソッド
# 　→特異メソッドは特異クラスのインsたんとメソッド
message = "Hello"
def message.build_greeting(target)
	"#{self}, #{target}."
end
p message.build_greeting("world")
message2 = "Hello"
# p message2.build_greeting("world")  # NoMethodError
# messageのインスタンスのみbuild_greetingメソッドが使用出来る
# singletonパターンの大体として使用される
puts "\n8-18.Singletonパターン"
CENTRAL_REPOSITORY = Object.new
def CENTRAL_REPOSITORY.register(target)
	@registered_object ||= []
	unless @registered_object.include? target
		@registered_object << target
	end
end
def CENTRAL_REPOSITORY.unregister(target)
	@registered_object ||= []
	@registered_object.delete(target)
end

puts "\n8-19.特異クラス"
# ある特定のインスタンスのためだけにあるクラス
# CENTRAL_REPOSITORY = Object.new
class << CENTRAL_REPOSITORY
	def register(target)
		@registered_object ||= []
		unless @registered_object.include? target
			@registered_object << target
		end
	end
	def unregister(target)
		@registered_object ||= []
		@registered_object.delete(target)
	end
end
# クラス名の代わりに「<<」を記述して定義
# 特定のインスタンスを拡張するだけのクラス（元のクラスを継承している）

puts "\n8-21.クラスメソッドとメタクラス"
# 特異メソッド定義式はクラスメソッド定義と酷似している
# 　→クラスメソッドはClassオブジェクトの特異メソッドとなる
class Duration
	def self.a_week_from(from)
		return self.new(from, from+7*24*60*60)
	end
end
p Duration.a_week_from(Time.now)

puts "\n8-22.メタクラス"
class Duration
	class << self
		def a_week_from(from)
			return self.new(from,from+7*24*60*60)
		end
	end
end
p Duration.a_week_from(Time.now)
# クラスメソッドを大量に定義する場合やClassオブジェクトに対してattr_accessorで属性を指定したい場合はこちらが便利
