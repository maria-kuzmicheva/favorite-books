module Printing
    class Publisher
        def get_order(order)
            Array.new(order.number) do
                product_entity[order.printing_type].new(order.pages, order.text)
            end
        end

        private 
         def product_entity
            {book: Book, newspaper: Newspaper, magazine: Magazine}
         end
    end
end
