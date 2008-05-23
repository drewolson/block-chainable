require 'rubygems'
require 'need'
need{'foo'}

class Baz < Foo
  def is_baz?
    true
  end
end