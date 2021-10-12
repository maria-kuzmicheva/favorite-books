class FavoriteBook < ApplicationRecord
    has_and_belongs_to_many :users
    validates :book_api_id, uniqueness: true
    has_many :comments
    has_and_belongs_to_many :book_lists

    has_many :ratings
    has_many :rating_users, through: :ratings, source: :user

end
