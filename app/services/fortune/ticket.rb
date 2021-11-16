module Fortune
    class Ticket
        include Generator
        attr_accessor :id, :combination
        def initialize
            
            @combination = generate
            @id = @combination.sum
        end
    end
end