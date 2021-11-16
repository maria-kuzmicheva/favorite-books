module Valley
    class AppleTree
        def initialize(apples_colour)
                @apples_colour = apples_colour 
                apple_count = rand(10..20)
                @apples = Array.new(apple_count) do 
                    Apple.new(apples_colour)
                end
        end

        def pick_up(n)
                @apples.shift(n)
        end
            def current_number_apples
                @apples.count
            end
    end
end


