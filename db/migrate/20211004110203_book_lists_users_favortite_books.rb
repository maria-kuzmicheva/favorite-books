class BookListsUsersFavortiteBooks < ActiveRecord::Migration[6.1]
  def change
    create_join_table :book_lists, :users, :favorite_books
  end
end


