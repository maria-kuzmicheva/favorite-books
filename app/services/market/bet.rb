module Market
    class Bet 
        attr_reader :price, :name
        def initialize(title, price, name)
            @title = title
            @price = price
            @name = name
        end
    end
end