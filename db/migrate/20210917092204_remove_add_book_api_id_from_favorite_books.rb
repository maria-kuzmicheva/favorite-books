class RemoveAddBookApiIdFromFavoriteBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorite_books, :bookapiid, :string
  end
end
