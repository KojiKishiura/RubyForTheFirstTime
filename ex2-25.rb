#!/usr/bin/ruby

class Foo
  def each
  	#item = 2
  end
  def map
  	result = []
  	self.each {|item| result << yield(item)}
  end
end

a = Foo.new
p a.map
