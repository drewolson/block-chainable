require 'rubygems'
require 'need'
need{"foo"}
need{"bar"}
need{"baz"}

require "test/unit"

class TestBlockChainable < Test::Unit::TestCase
  def test_standard_method_call
    Foo do
      assert is_foo?
    end
  end
  
  def test_standard_method_call_inner_block
    Foo do
      Bar do
        assert is_bar?
      end
    end
  end
  
  def test_outer_block_method_call_from_inner_block
    Foo do
      Bar do
        assert is_foo?
      end
    end
  end
  
  def test_inner_block_method_call_from_outer_block_fails
    assert_raises NoMethodError do
      Foo do
        is_bar?
        Bar do 
        end
      end
    end
  end
  
  def test_block_chainable_works_with_inheritance
    Baz do
      assert is_baz?
    end
  end
  
  def test_method_with_block_in_parent_scope
    Foo do
      Bar do
        assert(call_block{true})
      end
    end
  end
end