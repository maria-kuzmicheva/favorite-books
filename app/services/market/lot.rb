module Market
    class Lot 
        attr_accessor :start_price, :active 
       
       
        def initialize(title, start_price)
            @title = title
            @start_price = start_price
            @bets = [] 
            @active = true
        end

        def accept_bet(bet)
            if bet.price > @start_price &&  @bets.all?{|bet_item| bet_item.price < bet.price} && @active == true

                @bets << bet
                puts "ваша ставка принята"
            else
                puts "ваша ставка не принята"
            end
        end

        def max_bet
           @bets.max {|a,b| a.price <=> b.price } 

        end
    end
end
