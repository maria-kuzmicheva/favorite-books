require 'csv'
class BookReport
    def data
        FavoriteBook.all
    end

    def call
        CSV.open("/Users/mariiakuzka/FavoriteBooks/app/services/favbook_report.csv", "wb") do |csv|
            self.data.find_each do |item|
            csv << [item.title, item.authors]
            end
        end
   end
end
