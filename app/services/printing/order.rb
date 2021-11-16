module Printing
    
    class Order
        attr_reader :number, :printing_type, :text, :pages
        def initialize(number, pages, text, printing_type)
          @number = number 
          @pages  = pages
          @text   = text 
          @printing_type = printing_type
        end
    end
end