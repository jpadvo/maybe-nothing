class Object
  def maybe
    MaybeNothing::Some.new(self)
  end
end

class NilClass
  def maybe
    MaybeNothing::None.new
  end
end

module MaybeNothing
  class Some
    def initialize(object)
      @object = object
    end
  
    def get
      @object
    end
  
    def present?
      true
    end
  
    def blank?
      false
    end
  end
  
  class None
    class Unwrapped < StandardError; end
  
    def get
      raise Unwrapped
    end
  
    def present?
      false
    end
  
    def blank?
      true
    end
  end
end