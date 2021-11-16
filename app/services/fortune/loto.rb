module Fortune
    class Loto 
        include Generator
        attr_accessor :participations
        def initialize
            @tickets = []
            @winner_combination = generate
        end


        #def <<(ticket)
           # @tickets << ticket
        #end

        def find_winners
         winners =  @participations.select{|user| (@winner_combination & user.ticket.combination).present?} 
          
          loto_results = winners.each{|user| user.ticket_match_count = (user.ticket.combination & @winner_combination).size}

         a =  loto_results.sort{|a,b| b.ticket_match_count <=> a.ticket_match_count}.first(5)
         
          a.each {|user| puts " имя победителя #{user.full_name} количество совпадений #{user.ticket_match_count}"}

        end
    end
end
