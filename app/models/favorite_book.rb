class FavoriteBook < ApplicationRecord
    has_and_belongs_to_many :users
    validates :book_api_id, uniqueness: true
   
end
