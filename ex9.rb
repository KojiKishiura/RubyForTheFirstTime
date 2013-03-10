#!/usr/bin/ruby
#encoding: utf-8

puts "\n9-1.Network"
require 'open-uri'
open("http://www.oreilly.co.jp") {|connection|
	connection.each_line do |line|
		print line
	end
}

puts "\n9-2.Database"
require 'rubygems'
gem 'activerecord'
require 'active_record'
# オンメモリにデータベースを構築
ActiveRecord::Base.establish_connection \
	:adapter => 'sqlite3', :database => ':memory:'
# 表を作成
ActiveRecord::Base.connection.create_table("books") do |t|
	t.string :isbn, :limit => 13, :null => false, :unique => true
	t.string :title, :null => false
	t.timestamps
end
# 書籍データバースへの追加、検索
class Book < ActiveRecord::Base; end
Book.create!(:isbn => '9784003220931', :title => "ガリヴァー旅行記")
p Book.find_by_title("ガリヴァー旅行記")

puts "\n9-3.Image"
# require 'rubygems'
# require 'gd2'
# image = GD2::Image::TrueColor.new(270, 200)
# image.draw do |pen|
# 	pen.color = image.palette.resolve GD2::Color[1.0,1.0,1.0]
# 	pen.fill
# 	pen.color = image.palette.resolve GD2::Color[1.0,0.0,0.0]
# 	pen.thickness = 2
# 	pen.muve_to 20, 50
# 	pen.font = GD2::Font::TrueType['/Library/Fonts/Courier New.ttf', 40]
# 	pen.text "%s\n%s\n%s" % %w[Welcome to Ruby].map{|s| s.center(7)}
# end
# image.expert('09-003-output.png')
# 実行にはgd2 gemと gd2ライブラリが必要

puts "\n9-4.GUI"
# なんかうまく動かないので後日調査
# require 'rubygems'
# gem 'wxruby'
# require 'wx'
# require 'open-uri'
# class Hello < Wx::App
# 	def on_init
# 		resource = Wx::XmlResource.get
# 		resource.init_all_handlers
# 		resource.load("09-004-hello.wxg")
# 		@main = resource.load_frame(nil, "main")
# 		init_browser(@main.children.grep(Wx::HtmlWindow).first)
# 		init_button(@main.children.grep(Wx::Button).first)
# 		init_url(@main.children.grep(Wx::TextCtrl).first)
# 		@main.show
# 	end
# 	priate
# 	def init_browser(ctrl); @browser = ctrl end
# 	def init_url(ctrl); @url = ctrl end
# 	def init_button(ctrl)
# 		@button = ctrl
# 		@button.evt_button(@button.id){
# 			open(@url.get_value){|f| @browser.set_page f.read }
# 		}
# 	end
# end
# Hello.new.main_loop
#

puts '9-5.eval族'
# b = binding
# while code = gets
# 	p eval(code, b)
# end
# 外部入力をevalするようなプログラムをネットワーク接続するのは危険！！！

puts '9-6.コンテキストのすり替え'
class CybernatedAndroid
	def initialize(name) @name = name end
end
proc = Proc.new {
	p self
	p @name
}

proc.call
dicey = CybernatedAndroid.new("dicey1")
dicey.instance_eval(&proc)
# selfをすり替えてブロックを評価し、インスタンス変数にもアクセスできる
puts '9-7.コンテキストのすり替え（モジュール）'
dicey = CybernatedAndroid.new("dicey2")
CybernatedAndroid.class_eval do
	def save; puts "saved" end
end
dicey.save   #class_evalによって定義されたメソッド

# コンテキストのすり替えはプログラムを難しくしてしまう
# しかし、言語内DSLを構築するには欠かせない。
# なぜならこのコンテキストのすり替えを行うことでメソッドをレシーバを付けずに簡潔に記述することが出来る
# 例はex1-20.rb

puts '9-8.method_missing'
class Reporter
	def method_missing(method_name, *arguments)
		puts "メソッド#{method_name}が次の引数で呼ばれました"
		arguments.each{|arg| puts arg }
	end
end
reporter = Reporter.new
reporter.reporter
reporter.emergency 1, 2, 3
# Railsではこの機能によって、メソッドが呼ばれた時に必要に応じて定義を作成するような手法が多用されている
# ex9-2でfind_by_titleが定義なしで使用できるのは背後でmethod_missingが働いているから

puts '9-9.set-trace_func'
# set_trace_func proc { |event, file, line, id, binding, classname|
# 	printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname
# }
1 + 1
# メソッドが呼ばれたり、戻ったり、クラスが定義されたり、インスタンス化したりするたびにコールばくルーチンが呼ばれる

puts '9-10.継続'
require 'continuation' if RUBY_VERSION >= '1.9'
1.upto(10) do |i|
	if i == 3
		$cont = callcc{|continuation|  	#(1)
			continuation
		}								#(2)
	end
	print i, ' '
end
$cont.call(nil) if $cont 					#(3)
# i=3の時点で継続をグローバル変数に保存してあとで利用。
# callccはイテレータを途中まで実行中の(1)時点での継続をブロック引数としてブロックを評価する
# 継続の先頭に相当する実行位置はほぼ(2)の位置
# (3)で継続オブジェクトのcallメソッドを呼ぶとRubyは継続を評価する。
# その結果ｍすでに過ぎ去った(2)の時点に、イテレータを実行中だった実行環境に復帰する。
# そして、イテレータを途中から再度実行する
# 実用例はそんなに多くない。