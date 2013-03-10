#!/usr/bin/ruby
a, b = "str", "str"
def a.greet
	puts " I am the object #{self.object_id}"
end
#このオブジェクトだけで使えるメソッド
a.greet
#クラスや値は同じでも、オブジェクトして別なら未定義
b.greet