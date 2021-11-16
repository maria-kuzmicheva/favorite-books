module Cure
    class Patient
        attr_accessor :cheapest_pharmacy
        def initialize(prescription)
            @prescription = prescription
        end

        def ask_for(pharmacy)
          if  @cheapest_pharmacy.blank? || pharmacy.get_total(@prescription) < @cheapest_pharmacy.get_total(@prescription)
            @cheapest_pharmacy = pharmacy
          end
            pharmacy.get_total(@prescription)
        end



    end
end
