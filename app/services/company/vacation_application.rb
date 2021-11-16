module Company

    class VacationApplication

        attr_accessor :interval
        def initialize(employee, start, fin)
            @start = start
            @fin = fin
            @interval = (@start..@fin)
            @employee = employee

                    #cover?("2022,01,15") 
                    #(start..fin).each do |d|
                        #puts "#{d.strftime("%a")} #{d.wday} #{d.cwday}"
                    #end
        end
    end
end
