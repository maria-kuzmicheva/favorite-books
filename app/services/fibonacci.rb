class Fibonacci

    def solve(n) 
        first_num = 0
        second_num = 1
        (n-1).times do
            
            first_num, second_num = second_num, first_num + second_num
        end
        puts first_num
        
    end
end