module Cure
    class Pharmacy
       
        def initialize(title, pills_price)
            @title = title
            @pills_price = pills_price
        end

      def get_total(prescription)
        total = 0.0
        @pills_price.slice(*prescription.pills).each do |_, pills_price|
        
            total += pills_price
        end
        total
      end

    end
end