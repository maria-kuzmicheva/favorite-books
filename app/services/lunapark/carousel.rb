module Lunapark
    class Carousel
       
        def initialize
            @tickets = []
        end

        def take_seat!(ticket)
           
          if @tickets.size < 5
                    @tickets << ticket 
            puts  "билет добавлен"
            true
          else
            puts "все билеты проданы"
               false
          end

     
          

        end

        def start!
           if @tickets.size == 5
              puts  "начинаем крутиться"
              sleep 5
             @tickets = []
           else
            puts "недостаточно проданных билетов"
           end



        end
    end
end