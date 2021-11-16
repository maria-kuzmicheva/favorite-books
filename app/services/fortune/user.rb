module Fortune
    class User
        attr_accessor :full_name, :ticket, :ticket_match_count 
        def initialize
            @full_name = Faker::Name.name  
        end
    end
end