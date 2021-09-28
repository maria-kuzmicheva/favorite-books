class Comment < ApplicationRecord
    has_rich_text :content
    belongs_to :user
    belongs_to :favorite_book
    
end
