require 'rubygems'
require 'need'
need{"foo"}
need{"bar"}

describe "test block chainable" do
  it "should work on standard method calls" do
    Foo do
      is_foo?.should == true
    end
  end
  
  it "should work for standard method calls on nested blocks" do
    Foo do
      Bar do
        is_bar?.should == true
      end
    end
  end
  
  it "it should allow calls to outer block methods from inner blocks" do
    Foo do
      Bar do
        is_foo?.should == true
      end
    end
  end
  
  it "should not allow method calls to inner blocks from outer blocks" do
    lambda do
      Foo do
        is_bar?
        Bar do 
        end
      end
    end.should raise_error(NoMethodError)
  end
end