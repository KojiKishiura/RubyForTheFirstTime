#!/usr/bin/ruby
p Fixnum.class
p Fixnum.object_id
p Fixnum.ancestors   			#祖先クラスを問い合わせ
p Fixnum.instance_methods #インスタンスメソッドの一覧
#インスタンスのクラスへの所属判定
p 1.kind_of? Fixnum
p "str".kind_of? Fixnum
p Fixnum.kind_of? Class
p Fixnum.kind_of? Object