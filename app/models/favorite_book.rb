class FavoriteBook < ApplicationRecord
    belongs_to :user
    validates :book_api_id, uniqueness: true
   
end
