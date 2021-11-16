module Fortune
    module Generator
    def generate
        @combination = 7.times.map{rand(10..99)}
    end
    end
end