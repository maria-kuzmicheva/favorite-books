class FavoriteBook < ApplicationRecord
    validates :book_api_id, uniqueness: true
end
