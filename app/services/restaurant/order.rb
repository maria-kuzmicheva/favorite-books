module Restaurant
    class Order
   
        def initialize(table_number)
      
          @table_number     = table_number
         @dishes = []
        end

        def get!(dish)
           @dishes << dish
        end

        def total
            total = 0.0
            
             @dishes.each do |dish|
                total += dish.price 
             end
            total
        end

        def check
            check = ""
           @dishes.each do |dish|
           
             check +="#{dish.position}     #{dish.price}\n"     
                
           end
           puts  check += "------\n total #{total}"


        end
    end
end