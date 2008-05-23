module BlockChainable
  module ClassMethods
    def start(*args,&block)
      klass_instance = self.new(*args)
      
      klass_instance.instance_variable_set("@__parent",eval("self",block))
      
      class << klass_instance
        def method_missing(name,*args,&block)
          if chain_respond_to?(name)
            @__parent.send(name,*args,&block)
          else
            super
          end
        end
      end
      
      klass_instance.instance_eval(&block)
      
      klass_instance
    end
    
    def inherited(klass)
      klass.class_eval{include BlockChainable}
    end
  end
  
  def self.included(klass)
    klass.extend(ClassMethods)
    
    Object.class_eval <<-EOS
      def #{klass}(*args,&block)
        #{klass}.start(*args,&block)
      end
    EOS
  end
  
  def chain_respond_to?(name)
    self.respond_to?(name) || 
    (@__parent && 
    (@__parent.respond_to?(name) || 
    (@__parent.respond_to?(:chain_respond_to?) && @__parent.chain_respond_to?(name))))
  end
end