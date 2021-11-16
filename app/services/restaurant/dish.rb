module Restaurant
    class Dish
    attr_accessor  :price, :position
        def self.find(n)
           dish_data = menu[n]
           new(dish_data[:position], dish_data[:price])
         end

        def self.menu
            {
                1 => {position: "hotdog", price: 250},
                2 => {position: "salad",  price: 300},
                3 => {position: "juice",  price: 100}
            }
        end


        def initialize(position, price)
            @position = position
            @price    = price

        end

        
       
    end
end

