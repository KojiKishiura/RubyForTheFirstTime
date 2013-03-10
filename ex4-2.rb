#!/usr/bin/ruby
#encoding: utf-8

p "Hello"
p "日本語"
p 'single quoted'
p ' return
	string'
p "\n"
p "\007"
p "\x1B"
p "\Z"
p "\u2318"
p "\u{3042 3044 3046}"
print "\n"

# 式展開
# 文字列表現("")の内部でRubyの式が評価される
# .to_sメソッドで文字列表現に変換される
puts '-- 4.1.3 式展開 --'
a = 2
p "aの値は#{a}"
p "aの5乗は#{a ** 5}"
p "現在時刻: #{Time.now}"
p "標準入力の文字列表現: #{$stdin}"

a = 2
puts "aの#{"値#{
	#コメント
	"は#{a}"}"}"
print "\n"

# 文字リテラル
puts '4.2.1'
p ?あ

print "\n"
