class Tomato

    def initialize
      @start_time = Time.now
    end

    def colour
        current_time = Time.now
        if time_since_creation(current_time) < 3 
                "green"
        elsif (3..6).include?(time_since_creation(current_time))
                "brown"
        elsif (7..50).include?(time_since_creation(current_time))
                "red"
        else
            "rotten"
        end
    end

    private 

    def time_since_creation(current_time)
      current_time - @start_time 
    end

end
