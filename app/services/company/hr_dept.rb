module Company
    class HrDept
        def initialize
            @applications = []
        end
        def accept_application(vacation, vacation_application)
            app = vacation_application
            return(puts "измените длительность") if (app.interval).count > 15 
          
            if @applications.all?{|app| ((app.interval.to_a) & (app.interval.to_a)).empty?}
                    @applications << app
                puts "ok"
            else 
                puts "пожалуйста, измените интервал"
            end

        end
    end
end
