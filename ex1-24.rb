#!/usr/bin/ruby
p "str" == "str"		#文字列の同値性比較
p 1 == 1.0					#数値の同値性比較
p 1.14 + 2					#数値の加算
p "str" + "ing"			#文字列結合
p 1 << 2						#ビットシフト
p ["a", "b"] << "c"	#要素挿入
$stdout << "hoge"		#ストリームへの出力
