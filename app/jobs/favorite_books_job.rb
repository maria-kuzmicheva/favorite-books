class FavoriteBooksJob < ApplicationJob

    def perform
        BookReport.new.call
    end

   
end