class Plant
    attr_accessor :error
   def initialize
     @last_timestamp = Time.current
   end

    def water
        current_time = Time.current 
        if @last_timestamp + 60 > current_time
            @last_timestamp = current_time
            puts "ok"
            true
        else
           @error =  PlantError.new("вы его поздно полили!!!!!!")
           
            false
        end
    end
    class PlantError

        attr_accessor :message
        def initialize(message)
            @message = message
        end
    end
end