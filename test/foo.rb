require 'rubygems'
require 'need'
need{"../lib/block_chainable"}

class Foo
  include BlockChainable
  
  def is_foo?
    true
  end
  
  def call_block &block
    block.call
  end
end