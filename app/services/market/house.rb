module Market
    class House
       
        def initialize(*lots)
            @lots = lots
        end
        

        def suggest(lot, bet)
            lot.accept_bet(bet)
        end
        
        

        def close_lot!(lot)
            @active = false
            @winner_bet = lot.max_bet
             puts "максимальная ставка #{@winner_bet.price} покупатель #{@winner_bet.name}"
        end
    end
end