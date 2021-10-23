class FavoriteBook < ApplicationRecord

    attr_accessor :api_data

    has_and_belongs_to_many :users
    validates :book_api_id, uniqueness: true
    has_many :comments
    has_and_belongs_to_many :book_lists

    has_many :ratings
    has_many :rating_users, through: :ratings, source: :user


    def api
     @api_data ||= BookFetcher.get_by_id(self.book_api_id) 
    end

    def small_thumbnail
        api.dig("volumeInfo", "imageLinks", "smallThumbnail")
    end
    def title
        api.dig("volumeInfo", "title")
    end

    def description
        api.dig("volumeInfo", "description")
    end

    def authors
        api.dig("volumeInfo", "authors")
    end
    
    def subtitle
       api.dig("volumeInfo", "subtitle")
    end
    def publisher
        api.dig("volumeInfo", "publisher")
    end
    
    def averageRating
        api.dig("volumeInfo", "averageRating")
    end
   
end
