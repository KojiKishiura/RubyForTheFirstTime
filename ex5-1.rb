#!/usr/bin/ruby
#encoding: utf-8

puts '5-1 プログラムへの引数'
expression  = ARGV.join(' + ')
total = ARGV.inject(0){|subtotal, arg| subtotal + arg.to_i}
puts "#{expression} = #{total}"