require 'rubygems'
require 'need'
need{"../lib/block_chainable"}

class Bar
  include BlockChainable
  
  def is_bar?
    true
  end
end