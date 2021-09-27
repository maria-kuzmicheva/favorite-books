class CreateJoinTableUserFavoriteBook < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :favorite_books do |t|
      # t.index [:user_id, :favorite_book_id]
      # t.index [:favorite_book_id, :user_id]
    end
  end
end
