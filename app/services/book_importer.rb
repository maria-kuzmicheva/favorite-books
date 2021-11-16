require "csv"

class BookImporter
    def get_data
        BookFetcher.call("blue", 4).to_a
    end

    def call
        CSV.open("/Users/mariiakuzka/FavoriteBooks/app/services/booksdata.csv", "wb") do |csv|
            self.get_data.each do |item|
              csv << [item.dig("volumeInfo", "title"), item.dig("volumeInfo", "authors").try(:join, "; "), item.dig("volumeInfo", "publishedDate")]
            end
        end
    end
end

