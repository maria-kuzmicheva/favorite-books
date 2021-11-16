module Fonbet 
    class Hyppo
        def initialize
            @win_number = rand(1..5)
        end

        def accept_bet!(user, amount, number)
         #return(puts "на вашем счёте недостаточно средств") if user.bet == 0 
         return(puts "на вашем счёте недостаточно средств") if user.bet < amount
            if number == @win_number
                #user.bet += (amount*2)
                puts "вы выиграли! теперь на вашем счёте #{user.bet += (amount*2)}"
            else

                #user.bet -= (amount*2)
                puts "вы проиграли, теперь ваш остаток на счёте #{user.bet -= (amount*2)} "
            end
        end
    end
end
