class HappyGame
    def initialize(max=nil) 
        puts  "введите число: "
  
        @n = rand(1..(max || 100))
        @counter = 0
    end

    def guess!(n)
        @counter += 1 
            if n == @n
       
                puts "вы угадали за #{@counter} попыток"
            elsif n < @n
                puts "ваше число меньше загаданного"
            else 
                puts "ваше число больше загаданного"
            end
    end
end

